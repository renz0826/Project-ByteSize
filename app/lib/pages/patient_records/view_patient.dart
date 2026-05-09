import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:heroicons/heroicons.dart';
import '../../widgets/app_info_bar.dart';
import '/../style/theme.dart';
import '/../db/database.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ViewPatientScreen extends StatefulWidget {
  final PatientData patient;
  final List<ClinicalRecordData> clinicalRecords;
  final VoidCallback onBack;
  final ValueChanged<String> onMenuAction; 

  const ViewPatientScreen({
    super.key,
    required this.patient,
    required this.clinicalRecords,
    required this.onBack,
    required this.onMenuAction, 
  });

  @override
  State<ViewPatientScreen> createState() => _ViewPatientScreenState();
}

class _ViewPatientScreenState extends State<ViewPatientScreen> {
  bool _isDropdownOpen = false;
  int? _selectedRecordId;

  ClinicalRecordData? get _selectedRecord => 
  widget.clinicalRecords.where((r) => r.recordId == _selectedRecordId).firstOrNull;

  @override
  void initState() {
    super.initState();
    if (widget.clinicalRecords.isNotEmpty) {
      _selectedRecordId = widget.clinicalRecords.first.recordId;
    }
  }

  //date helpers
  String _formatDate(DateTime date) => DateFormat('MMMM d, y').format(date);

  String _formatAppointment(DateTime date) =>
      DateFormat("MMMM d, y '-' h:mm a").format(date);

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray200,
      child: SingleChildScrollView( // to allow the page to be scrollable
        padding: const EdgeInsets.only(bottom: 30), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //patient name header
            _buildNameHeader(context),
            const SizedBox(height: 8),

            //personal details
            _buildPersonalDetailsCard(context),
            const SizedBox(height: 16),

            //clinical record that only shows if there are records
            if (widget.clinicalRecords.isEmpty)
              _buildNoClinicalRecordCard(context)
            else
              _buildClinicalRecordCard(context),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // name header 
  Widget _buildNameHeader(BuildContext context) {
    final fullName =
        '${widget.patient.lastName}, ${widget.patient.firstName ?? ''} ${widget.patient.middleName}'
            .trim();

    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.floatShadow,
      ),
      child: Row(
        children: [
          // patient full name
          Expanded(
            child: Text(
              fullName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          // actions menu
          _MoreOptions(
            onSelected: widget.onMenuAction, // ADDED: Links menu to dashboard
            items: [
                BarMenuItem(value: 'add_clinical_record', icon: HeroIcons.documentPlus, label: 'Add New Clinical Record'),
                BarMenuItem(value: 'add_schedule', icon: HeroIcons.calendar, label: 'Add Schedule'),
                BarMenuItem(value: 'edit_details', icon: HeroIcons.pencilSquare, label: 'Edit Personal Details'),
                BarMenuItem(value: 'archive', icon: HeroIcons.archiveBox, label: 'Archive Record', color: AppTheme.red600),
            ],
          ),
        ],
      ),
    );
  }

  // personal details
  Widget _buildPersonalDetailsCard(BuildContext context) {
    return _BaseCard(
      title: 'Personal Details',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: DoB, age, sex, civil status
          Row(
            children: [
              _InfoBlock(
                label: 'Date of Birth',
                value: _formatDate(widget.patient.birthDate),
                flex: 2,
              ),
              _InfoBlock(
                label: 'Age',
                value: (() {
                  final age = _calculateAge(widget.patient.birthDate);
                  // If age is 60 or more, the label will appear
                  return age >= 60 ? '$age (Senior)' : '$age';
                })(),
                flex: 2,
              ),
              _InfoBlock(label: 'Sex', value: widget.patient.sex, flex: 1,),
              _InfoBlock(label: 'Civil Status', value: widget.patient.civilStatus, flex: 2),
            ],
          ),
          const SizedBox(height: 24),

          // Row 2: phone, emergency contact, emergency contact relationship
          Row(
            children: [
              _InfoBlock(
                label: 'Phone No.',
                value: widget.patient.contactNumber,
              ),
              _InfoBlock(
                label: 'Emergency Contact No.',
                value: widget.patient.emergencyContactNo ?? '—',
              ),
              _InfoBlock(
                label: 'Relationship to the Patient',
                value: widget.patient.relationshipEmergency ?? '-',
              ),
            ],
          ),
          const SizedBox(height: 24),

          //Row 3: referred by, relationship
          Row(
            children: [
              _InfoBlock(
                label: 'Referred By',
                value:widget. patient.referredBy ?? '—',
              ),
              _InfoBlock(
                label: 'Relationship to Referral',
                value: widget.patient.relationship ?? '—',
              ),
              _InfoBlock(
                label: 'PWD Status',
                value: widget.patient.isSeniorOrPWD == true ? 'Applicable' : 'Not Applicable',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Row 4: full address
          _InfoBlock(
            label: 'Address',
            value:
                '${widget.patient.streetAddress}, ${widget.patient.barangay}, ${widget.patient.cityMunicipality}, ${widget.patient.province} ${widget.patient.zipCode}',
            flex: 0, //takes natural width
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // clinical record card 
  Widget _buildClinicalRecordCard(BuildContext context) {
    return _BaseCard(
      title: 'Clinical Record',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Appointment Schedule dropdown 
          Text('Appointment Schedule',
            style: AppTheme.textTheme.bodySmall?.copyWith(color: AppTheme.gray500)),
        const SizedBox(height: 8),
          
        GestureDetector(
          onTap:() => setState(() => _isDropdownOpen = true),
        child: SizedBox(
          width: 300, 
          child: DropdownSearch<int>(
            // list of record ids
            items: (filter, loadProps) => 
            widget.clinicalRecords.map((r) => r.recordId).toList(),
            //pre-select most recent record
            selectedItem: _selectedRecordId,
            //display formatted appointment
            itemAsString: (id) {
              final record = widget.clinicalRecords
              .where((r) => r.recordId == id).firstOrNull;
              return record != null 
              ? _formatAppointment(record.createdAt)
              : '-';
            },
            onSelected: (selectedId) {
              setState(() {
                _selectedRecordId = selectedId;
                _isDropdownOpen = false;
              });
            },

            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppTheme.gray400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppTheme.gray400, width: 1.5)
                ),
                filled: true,
                fillColor: AppTheme.white500,
                suffixIcon: HeroIcon(
                  _isDropdownOpen ? HeroIcons.chevronUp : HeroIcons.chevronDown,
                  size: 18,
                  color: AppTheme.gray500,
                ),
              ),
            ),

            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              constraints: const BoxConstraints(maxHeight: 200),
              onDismissed: () => setState(() => _isDropdownOpen = false),
              interceptCallBacks: true,
              itemBuilder:(context, item, isDisabled, isSelected) {
                final record = widget.clinicalRecords
                .where((r) => r.recordId == item).firstOrNull;
                return Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    record != null ? _formatAppointment(record.createdAt) : '-',
                    style: AppTheme.textTheme.bodySmall?.copyWith(
                      color: isSelected ? AppTheme.blue500 : AppTheme.black500,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                );
              },
              emptyBuilder: (context, searchEntry) => Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'No appointments found.',
                  style: AppTheme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
        ),
          const SizedBox(height: 24),

          // show clinical data only if a record is selected
          if (_selectedRecord != null) ...[
            Text('Medical Background',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 18),
          Row(
            children: [
              _InfoBlock(
                label: 'Past Illnesses',
                value: _selectedRecord!.pastIllness ?? 'None',
              ),
              _InfoBlock(
                label: 'Present Illnesses',
                value: _selectedRecord!.presentIllness ?? 'None',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _InfoBlock(
                label: 'Allergies',
                value: _selectedRecord!.allergies ?? 'None',
              ),
              _InfoBlock(
                label: 'Current Medication',
                value: _selectedRecord!.currentMedication ?? 'None',
              ),
            ],
          ),
          const SizedBox(height: 40),

          // treatment procedure
          Text('Treatment Procedure',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),

          // Row 1: oral Debris, calculus, gingivitis
          Row(
            children: [
              _InfoBlock(
                label: 'Presence of Oral Debris',
                value: _selectedRecord!.hasOralDebris ? 'Present' : 'None',
                isAlert: _selectedRecord!.hasOralDebris,
              ),
              _InfoBlock(
                label: 'Presence of Calculus',
                value: _selectedRecord!.hasCalculus ? 'Present' : 'None',
                isAlert: _selectedRecord!.hasCalculus,
              ),
              _InfoBlock(
                label: 'Presence of Gingivitis',
                value: _selectedRecord!.hasGingivitis ? 'Present' : 'None',
                isAlert: _selectedRecord!.hasGingivitis,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row 2: periodontal pocket, dentofacial anomaly
          Row(
            children: [
              _InfoBlock(
                label: 'Presence of Periodontal Pocket',
                value: _selectedRecord!.hasPeriodontalPocket ? 'Present' : 'None',
                isAlert: _selectedRecord!.hasPeriodontalPocket,
              ),
              _InfoBlock(
                label: 'Presence of Dentofacial Anomaly',
                value: _selectedRecord!.hasDentofacialAnomaly ? 'Present' : 'None',
                isAlert: _selectedRecord!.hasDentofacialAnomaly,
              ),
              const Expanded(child: SizedBox()), // balance the row
            ],
          ),
          const SizedBox(height: 40),

          // tooth count
          Text('Tooth Count', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),

          // Row 1: filling, extraction, root fragment
          Row(
            children: [
              _InfoBlock(
                label: 'Caries Indicated for Filling',
                value: _selectedRecord!.cariesForFilling > 0
                    ? '${_selectedRecord!.cariesForFilling}'
                    : 'None',
                isAlert: _selectedRecord!.cariesForFilling > 0,
              ),
              _InfoBlock(
                label: 'Caries Indicated for Extraction',
                value: _selectedRecord!.cariesForExtraction > 0
                    ? '${_selectedRecord!.cariesForExtraction}'
                    : 'None',
                isAlert: _selectedRecord!.cariesForExtraction > 0,
              ),
              _InfoBlock(
                label: 'Root Fragment',
                value: _selectedRecord!.rootFragment > 0
                    ? '${_selectedRecord!.rootFragment}'
                    : 'None',
                isAlert: _selectedRecord!.rootFragment > 0,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row 2: missing, filled or restored
          Row(
            children: [
              _InfoBlock(
                label: 'Missing Due to Caries',
                value: _selectedRecord!.missingDueToCaries > 0
                    ? '${_selectedRecord!.missingDueToCaries}'
                    : 'None',
                isAlert: _selectedRecord!.missingDueToCaries > 0,
              ),
              _InfoBlock(
                label: 'Filled or Restored',
                value: _selectedRecord!.filledOrRestored > 0
                    ? '${_selectedRecord!.filledOrRestored}'
                    : 'None',
                isAlert: _selectedRecord!.filledOrRestored > 0,
              ),
              const Expanded(child: SizedBox()), // balance the row
            ],
          ),
          const SizedBox(height: 40),

          // clinical Notes 
          _buildLabel(context, 'Clinical Notes',
              textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.gray500,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedRecord!.clinicalNotes ?? 'No notes provided.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.black500,
                  height: 1.6,
                ),
          ),
        ],
      ],
      ),
    );
  }

  // empty clinical record card
  Widget _buildNoClinicalRecordCard(BuildContext context) {
    return _BaseCard(
      title: 'Clinical Record',
      child: Text(
        'No clinical records found for this patient.',
        style: AppTheme.textTheme.bodySmall?.copyWith(color: AppTheme.gray400),
      ),
    );
  }

  //small gray label above a value
  Widget _buildLabel(BuildContext context, String label, {TextStyle? textStyle}) {
    return Text(
      label,
      style: textStyle ?? AppTheme.textTheme.bodySmall?.copyWith(
        color: AppTheme.gray500,
      ),
    );
  }
}



// shared options button
class _MoreOptions extends StatelessWidget {
  final List<BarMenuItem> items; 
  final ValueChanged<String>? onSelected;

  const _MoreOptions({required this.items, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppTheme.white500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsetsGeometry.zero,
      icon: const HeroIcon(HeroIcons.ellipsisHorizontal, color: AppTheme.gray500, size: 30),
      onSelected: onSelected,
      itemBuilder: (_) => items.map(_buildItem).toList(),
    );
  }

  PopupMenuItem<String>_buildItem(BarMenuItem item){
    return PopupMenuItem<String>(
      value: item.value,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(item.icon,
          color: item.color ?? AppTheme.gray500,
          size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            item.label,
            style: AppTheme.textTheme.bodySmall?.copyWith(
              color: item.color ?? AppTheme.black500,
            ),
          )
        ],
      ),
    );
  }
}

// _BaseCard for personal details and clinical record cards.
class _BaseCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _BaseCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 32),
          child,
        ],
      ),
    );
  }
}

// _InfoBlock 
class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;
  final int flex;
  final bool isAlert;

  const _InfoBlock({
    required this.label,
    required this.value,
    this.flex = 1,
    this.isAlert = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.textTheme.bodySmall
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: isAlert ? AppTheme.red600 : AppTheme.black500,
              ),
        ),
      ],
    );

    if (flex == 0) return content;
    return Expanded(flex: flex, child: content);
  }
}