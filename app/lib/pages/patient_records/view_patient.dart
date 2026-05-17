import '../../widgets/attribute_read_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:heroicons/heroicons.dart';
import '../../widgets/app_info_bar.dart';
import '/../style/theme.dart';
import '/../db/database.dart';
import '../../widgets/input_field.dart';

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
  int? _selectedRecordId;

  List<int> get _recordIds =>
      widget.clinicalRecords.map((r) => r.recordId).toList();

  List<String> get _recordLabels => widget.clinicalRecords
      .map((r) => _formatAppointment(r.createdAt))
      .toList();

  ClinicalRecordData? get _selectedRecord => widget.clinicalRecords
      .where((r) => r.recordId == _selectedRecordId)
      .firstOrNull;

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
      child: SingleChildScrollView(
        // to allow the page to be scrollable
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //patient name header
            _buildNameHeader(context),
            const SizedBox(height: 24),

            //personal details
            _buildPersonalDetailsCard(context),
            const SizedBox(height: 24),

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
        '${widget.patient.lastName}, ${widget.patient.firstName} ${widget.patient.middleName} ${widget.patient.suffix}'
            .trim();

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1200),
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
              onSelected: widget.onMenuAction,
              items: [
                BarMenuItem(
                    value: 'add_clinical_record',
                    icon: HeroIcons.documentPlus,
                    label: 'Add New Clinical Record'),
                BarMenuItem(
                    value: 'schedule_appointment',
                    icon: HeroIcons.calendar,
                    label: 'Add Schedule'),
                BarMenuItem(
                    value: 'edit_details',
                    icon: HeroIcons.pencilSquare,
                    label: 'Edit Personal Details'),

                // Added the Restore/Archive Feature here
                if (widget.patient.isArchived)
                  BarMenuItem(
                      value: 'unarchive',
                      icon: HeroIcons.arrowPath,
                      label: 'Restore Record',
                      color: Colors.blue)
                else
                  BarMenuItem(
                      value: 'archive',
                      icon: HeroIcons.archiveBox, 
                      label: 'Archive Record',
                      color: AppTheme.red600),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // personal details
  Widget _buildPersonalDetailsCard(BuildContext context) {
    return _BaseCard(
      title: 'Personal Details',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: DoB, age, sex, civil status
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Date of Birth',
                  content: _formatDate(widget.patient.birthDate),
                ),
              ),
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Age',
                  content: (() {
                    final age = _calculateAge(widget.patient.birthDate);
                    // If age is 60 or more, the label will appear
                    return age >= 60 ? '$age (Senior)' : '$age';
                  })(),
                ),
              ),
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Sex',
                  content: widget.patient.sex,
                ),
              ),
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Civil Status',
                  content: widget.patient.civilStatus,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Row 2: phone, emergency contact, emergency contact relationship
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Phone No.',
                  content: widget.patient.contactNumber,
                ),
              ),
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Emergency Contact No.',
                  content: widget.patient.emergencyContactNo ?? '—',
                ),
              ),
              Expanded(
                flex: 4,
                child: AttributeReadView(
                  label: 'Relationship to the Patient',
                  content: widget.patient.relationshipEmergency ?? '-',
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          //Row 3: referred by, relationship
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Referred By',
                  content: widget.patient.referredBy ?? '—',
                ),
              ),
              Expanded(
                flex: 2,
                child: AttributeReadView(
                  label: 'Relationship to Referral',
                  content: widget.patient.relationship ?? '—',
                ),
              ),
              Expanded(
                flex: 4,
                child: AttributeReadView(
                  label: 'PWD Status',
                  content: widget.patient.isSeniorOrPWD == true
                      ? 'Applicable'
                      : 'Not Applicable',
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Row 4: full address
          AttributeReadView(
            label: 'Address',
            content:
                '${widget.patient.streetAddress}, ${widget.patient.barangay}, ${widget.patient.cityMunicipality}, ${widget.patient.province} ${widget.patient.zipCode}',
          ),
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
        children: [ // Appointment Schedule dropdown
          SizedBox(
            width: 300,
            child: InputField(
              label: 'Day Created',
              variant: InputVariant.dropdown, // converted the recordId to formatted date strings
              dropdownItems: _recordLabels, // show the formatted date of the selected record
              dropdownValue: _selectedRecordId != null
                  ? _recordLabels[_recordIds.indexOf(_selectedRecordId!)]
                  : null,
              onDropdownChanged: (value) {
                if (value == null) return;
                //parse the id bback to string
                final index = _recordLabels.indexOf(value);
                if (index != -1) {
                  setState(() => _selectedRecordId = _recordIds[index]);
                }
              },
            ),
          ),
          const SizedBox(height: 32),

          // show clinical data only if a record is selected
          if (_selectedRecord != null) ...[
            Text('Medical Background',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AttributeReadView(
                    label: 'Past Illnesses',
                    content: _selectedRecord!.pastIllness ?? 'None',
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Present Illnesses',
                    content: _selectedRecord!.presentIllness ?? 'None',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AttributeReadView(
                    label: 'Allergies',
                    content: _selectedRecord!.allergies ?? 'None',
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Current Medication',
                    content: _selectedRecord!.currentMedication ?? 'None',
                  ),
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
                Expanded(
                  child: AttributeReadView(
                    label: 'Presence of Oral Debris',
                    content:
                        _selectedRecord!.hasOralDebris ? 'Present' : 'None',
                    isCrucial: _selectedRecord!.hasOralDebris,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Presence of Calculus',
                    content: _selectedRecord!.hasCalculus ? 'Present' : 'None',
                    isCrucial: _selectedRecord!.hasCalculus,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Presence of Gingivitis',
                    content:
                        _selectedRecord!.hasGingivitis ? 'Present' : 'None',
                    isCrucial: _selectedRecord!.hasGingivitis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Row 2: periodontal pocket, dentofacial anomaly
            Row(
              children: [
                Expanded(
                  child: AttributeReadView(
                    label: 'Presence of Periodontal Pocket',
                    content: _selectedRecord!.hasPeriodontalPocket
                        ? 'Present'
                        : 'None',
                    isCrucial: _selectedRecord!.hasPeriodontalPocket,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Presence of Dentofacial Anomaly',
                    content: _selectedRecord!.hasDentofacialAnomaly
                        ? 'Present'
                        : 'None',
                    isCrucial: _selectedRecord!.hasDentofacialAnomaly,
                  ),
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
                Expanded(
                  child: AttributeReadView(
                    label: 'Caries Indicated for Filling',
                    content: _selectedRecord!.cariesForFilling > 0
                        ? '${_selectedRecord!.cariesForFilling}'
                        : 'None',
                    isCrucial: _selectedRecord!.cariesForFilling > 0,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Caries Indicated for Extraction',
                    content: _selectedRecord!.cariesForExtraction > 0
                        ? '${_selectedRecord!.cariesForExtraction}'
                        : 'None',
                    isCrucial: _selectedRecord!.cariesForExtraction > 0,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Root Fragment',
                    content: _selectedRecord!.rootFragment > 0
                        ? '${_selectedRecord!.rootFragment}'
                        : 'None',
                    isCrucial: _selectedRecord!.rootFragment > 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Row 2: missing, filled or restored
            Row(
              children: [
                Expanded(
                  child: AttributeReadView(
                    label: 'Missing Due to Caries',
                    content: _selectedRecord!.missingDueToCaries > 0
                        ? '${_selectedRecord!.missingDueToCaries}'
                        : 'None',
                    isCrucial: _selectedRecord!.missingDueToCaries > 0,
                  ),
                ),
                Expanded(
                  child: AttributeReadView(
                    label: 'Filled or Restored',
                    content: _selectedRecord!.filledOrRestored > 0
                        ? '${_selectedRecord!.filledOrRestored}'
                        : 'None',
                    isCrucial: _selectedRecord!.filledOrRestored > 0,
                  ),
                ),
                const Expanded(child: SizedBox()), // balance the row
              ],
            ),
            const SizedBox(height: 40),

            // clinical Notes
            _buildLabel(
              context,
              'Clinical Notes',
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
  Widget _buildLabel(BuildContext context, String label,
      {TextStyle? textStyle}) {
    return Text(
      label,
      style: textStyle ??
          AppTheme.textTheme.bodySmall?.copyWith(
            color: AppTheme.gray500,
          ),
    );
  }
}

// shared options button
class _MoreOptions extends StatelessWidget {
  final List<BarMenuItem> items;
  final ValueChanged<String>? onSelected;

  const _MoreOptions({required this.items, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppTheme.white500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsetsGeometry.zero,
      icon: const HeroIcon(HeroIcons.ellipsisHorizontal,
          color: AppTheme.gray500, size: 30),
      onSelected: onSelected,
      itemBuilder: (_) => items.map(_buildItem).toList(),
    );
  }

  PopupMenuItem<String> _buildItem(BarMenuItem item) {
    return PopupMenuItem<String>(
      value: item.value,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(
            item.icon,
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
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 32),
            child,
          ],
        ),
      ),
    );
  }
}
