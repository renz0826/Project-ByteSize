import 'package:dentcity_management_system/db/database.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';

class AddClinicalRecordForm extends StatefulWidget {
  final int patientId;
  final Function(ClinicalRecordCompanion) onFinish;
  final VoidCallback onPrevious;
  const AddClinicalRecordForm(
      {super.key,
      required this.patientId,
      required this.onFinish,
      required this.onPrevious});

  @override
  State<AddClinicalRecordForm> createState() => _AddClinicalRecordFormState();
}

class _AddClinicalRecordFormState extends State<AddClinicalRecordForm> {
// Medical Background Controller
  final _pastIllnessController = TextEditingController();
  final _presentIllnessController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _medicationController = TextEditingController();

// Treatment Procedure (Radio Boxes): Setting this false as default
  bool _hasDebris = false;
  bool _hasCalculus = false;
  bool _hasGingivitis = false;
  bool _hasPeriodontalPocket = false;
  bool _hasDentofacialAnomaly = false;

// Tooth Count
  int _cariesFilling = 0;
  int _cariesExtraction = 0;
  int _missingDueToCaries = 0;
  int _rootFragment = 0;
  int _filledOrRestored = 0;

// Clinical Notes
  final _clinicalNotesController = TextEditingController();

  void _clearFormforClinicalRecord() {
    // clear these text fields onClick
    setState(() {
      // 1. Clear Medical Background & Notes
      _pastIllnessController.clear();
      _presentIllnessController.clear();
      _allergiesController.clear();
      _medicationController.clear();
      _clinicalNotesController.clear();

      // 2. Reset Treatment Procedures (Booleans)
      _hasDebris = false;
      _hasCalculus = false;
      _hasGingivitis = false;
      _hasPeriodontalPocket = false;
      _hasDentofacialAnomaly = false;

      // 3. Reset Tooth Counts (Integers)
      _cariesFilling = 0;
      _cariesExtraction = 0;
      _missingDueToCaries = 0;
      _rootFragment = 0;
      _filledOrRestored = 0;
    });
  }

  void _handleSave() {
    final recordEntry = ClinicalRecordCompanion.insert(
      patientId: widget.patientId // required
      ,
      // Medical Background
      pastIllness: drift.Value(_pastIllnessController.text),
      presentIllness: drift.Value(_presentIllnessController.text),
      allergies: drift.Value(_allergiesController.text),
      currentMedication: drift.Value(_medicationController.text),

      // Treatment Procedure (Booleans)
      hasOralDebris: drift.Value(_hasDebris),
      hasCalculus: drift.Value(_hasCalculus),
      hasGingivitis: drift.Value(_hasGingivitis),
      hasPeriodontalPocket: drift.Value(_hasPeriodontalPocket),
      hasDentofacialAnomaly: drift.Value(_hasDentofacialAnomaly),

      // Tooth Counts (Integers)
      cariesForFilling: drift.Value(_cariesFilling),
      cariesForExtraction: drift.Value(_cariesExtraction),
      rootFragment: drift.Value(_rootFragment),
      missingDueToCaries: drift.Value(_missingDueToCaries),
      filledOrRestored: drift.Value(_filledOrRestored),

      // Notes
      clinicalNotes: drift.Value(_clinicalNotesController.text),

      // Metadata
      createdAt: drift.Value(DateTime.now()),
    );

    // Send the bundled data back to the dashboard
    widget.onFinish(recordEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.floatShadow,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Clinical Record",
                  style: Theme.of(context).textTheme.headlineLarge),

              const SizedBox(height: 32),

              // -- MEDICAL RECORD --
              Text("Medical Background",
                  style: Theme.of(context).textTheme.titleLarge),

              const SizedBox(height: 12),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Past and Present Illnesses
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: InputField(
                        label: "Past Illnesses",
                        hintText: "Enter patient's past illnesses",
                        controller: _pastIllnessController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]'))
                        ],
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: InputField(
                        label: "Present Illnesses",
                        hintText: "Enter patient's present illnesses",
                        controller:
                            _presentIllnessController, // present illness controller
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]'))
                        ],
                      )),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Row 2: Allergies and Medication
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: InputField(
                        label: "Allergies",
                        hintText: "Enter patient's allergies",
                        controller: _allergiesController, // allergies controller
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]'))
                        ],
                      )), 
                      const SizedBox(width: 20),
                      Expanded(
                          child: InputField(
                        label: "Current Medication",
                        hintText: "Enter patient's current medication",
                        controller: _medicationController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]'))
                        ],
                      )),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // -- TREATMENT PROCEDURE --

                  Text("Treatment Procedure",
                      style: Theme.of(context).textTheme.titleLarge),

                  const SizedBox(height: 12),

                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row 1: Oral Debris, Calculus, and Gingivitis
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioGroupField(
                              label: "Presence of Oral Debris",
                              options: const ["Present", "None"],
                              selectedValue: _hasDebris ? "Present" : "None",
                              onChanged: (value) {
                                setState(
                                    () => _hasDebris = (value == "Present"));
                              },
                            ),
                            const SizedBox(width: 100),
                            RadioGroupField(
                              label: "Presence of Calculus",
                              options: const ["Present", "None"],
                              selectedValue: _hasCalculus ? "Present" : "None",
                              onChanged: (value) {
                                setState(
                                    () => _hasCalculus = (value == "Present"));
                              },
                            ),
                            const SizedBox(width: 100),
                            RadioGroupField(
                              label: "Presence of Gingivitis",
                              options: const ["Present", "None"],
                              selectedValue:
                                  _hasGingivitis ? "Present" : "None",
                              onChanged: (value) {
                                setState(() =>
                                    _hasGingivitis = (value == "Present"));
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Row 2: Periodontal Pocket and Dentofacial Anomaly
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioGroupField(
                              label: "Presence of Periodontal Pocket",
                              options: const ["Present", "None"],
                              selectedValue:
                                  _hasPeriodontalPocket ? "Present" : "None",
                              onChanged: (String value) {
                                setState(() {
                                  _hasPeriodontalPocket = (value == "Present");
                                });
                              },
                            ),
                            const SizedBox(width: 64),
                            RadioGroupField(
                              label: "Presence of Dentofacial Anomaly",
                              options: const ["Present", "None"],
                              selectedValue:
                                  _hasDentofacialAnomaly ? "Present" : "None",
                              onChanged: (String value) {
                                setState(() {
                                  _hasDentofacialAnomaly = (value == "Present");
                                });
                              },
                            ),
                          ],
                        ),
                      ]),

                  const SizedBox(height: 32),

                  // -- TOOTH COUNT --

                  Text("Tooth Count",
                      style: Theme.of(context).textTheme.titleLarge),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: 800,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row 1: Filling, Extraction, and Root Fragment
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InputField(
                                label: "Caries Indicated for Filling",
                                variant: InputVariant.counter,
                                counterValue:
                                    _cariesFilling, // changed to _carriesFilling
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _cariesFilling = newValue;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 64),
                            Expanded(
                              child: InputField(
                                label: "Caries Indicated for Extraction",
                                variant: InputVariant.counter,
                                counterValue:
                                    _cariesExtraction, // changed to _carriesExtraction
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _cariesExtraction = newValue;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 64),
                            Expanded(
                              child: InputField(
                                label: "Root Fragment",
                                variant: InputVariant.counter,
                                counterValue:
                                    _rootFragment, // changed to _rootFragment
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _rootFragment = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Row 2: Missing and Filled or Restored
                        SizedBox(
                          width: 510,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: InputField(
                                  label: "Missing Due to Caries",
                                  variant: InputVariant.counter,
                                  counterValue:
                                      _missingDueToCaries, // changed to _missingDueToCaries
                                  counterMin: 0,
                                  counterMax: 32,
                                  onCounterChanged: (newValue) {
                                    setState(() {
                                      _missingDueToCaries = newValue;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 64),
                              Expanded(
                                child: InputField(
                                  label: "Filled or Restored",
                                  variant: InputVariant.counter,
                                  counterValue:
                                      _filledOrRestored, // changed to _filledOrRestored
                                  counterMin: 0,
                                  counterMax: 32,
                                  onCounterChanged: (newValue) {
                                    setState(() {
                                      _filledOrRestored = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // -- TREATMENT PLAN --

                  Text("Treatment Plan",
                      style: Theme.of(context).textTheme.titleLarge),

                  const SizedBox(height: 12),

                  InputField(
                    hintText:
                        "Write important clinical notes during the appointment",
                    label: "Clinical Notes",
                    maxLines: 10,
                    controller: _clinicalNotesController,
                  ),

                  const SizedBox(height: 32),

                  Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Button(
                            variant: ButtonVariant.secondary,
                            label: "Clear",
                            width: double.infinity,
                            onPressed: _clearFormforClinicalRecord,
                          ),
                        ),
                        Button(
                          variant: ButtonVariant.secondary,
                          label: "Previous",
                          width: 160,
                          icon: Icons.arrow_back,
                          iconPlacement: IconPlacement.left,
                          onPressed: widget.onPrevious,
                        ),
                        Button(
                          label: "Save",
                          width: 140,
                          icon: Icons.save_alt_outlined,
                          iconPlacement: IconPlacement.left,
                          onPressed: _handleSave,
                        ),
                      ])
                ],
              ),
            ]),
      ),
    );
  }
}
