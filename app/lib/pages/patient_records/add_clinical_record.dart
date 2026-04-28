import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';

class AddClinicalRecordForm extends StatefulWidget {
  final VoidCallback onFinish;
  final VoidCallback onPrevious;
  const AddClinicalRecordForm(
      {super.key, required this.onFinish, required this.onPrevious});

  @override
  State<AddClinicalRecordForm> createState() => _AddClinicalRecordFormState();
}

class _AddClinicalRecordFormState extends State<AddClinicalRecordForm> {
  String? _defaultSelection;
  int _teethExtracted = 0;

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
                              hintText: "Enter patient's past illnesses")),
                      const SizedBox(width: 20),
                      Expanded(
                          child: InputField(
                              label: "Present Illnesses",
                              hintText: "Enter patient's present illnesses")),
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
                              hintText: "Enter patient's allergies")),
                      const SizedBox(width: 20),
                      Expanded(
                          child: InputField(
                              label: "Current Medication",
                              hintText: "Enter patient's current medication")),
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
                              selectedValue: _defaultSelection,
                              onChanged: (String value) {
                                setState(() {
                                  _defaultSelection = value;
                                });
                              },
                            ),
                            const SizedBox(width: 100),
                            RadioGroupField(
                              label: "Presence of Oral Debris",
                              options: const ["Present", "None"],
                              selectedValue: _defaultSelection,
                              onChanged: (String value) {
                                setState(() {
                                  _defaultSelection = value;
                                });
                              },
                            ),
                            const SizedBox(width: 100),
                            RadioGroupField(
                              label: "Presence of Oral Debris",
                              options: const ["Present", "None"],
                              selectedValue: _defaultSelection,
                              onChanged: (String value) {
                                setState(() {
                                  _defaultSelection = value;
                                });
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
                              selectedValue: _defaultSelection,
                              onChanged: (String value) {
                                setState(() {
                                  _defaultSelection = value;
                                });
                              },
                            ),
                            const SizedBox(width: 64),
                            RadioGroupField(
                              label: "Presence of Dentofacial Anomaly",
                              options: const ["Present", "None"],
                              selectedValue: _defaultSelection,
                              onChanged: (String value) {
                                setState(() {
                                  _defaultSelection = value;
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
                                counterValue: _teethExtracted,
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _teethExtracted = newValue;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 64),
                            Expanded(
                              child: InputField(
                                label: "Caries Indicated for Extraction",
                                variant: InputVariant.counter,
                                counterValue: _teethExtracted,
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _teethExtracted = newValue;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 64),
                            Expanded(
                              child: InputField(
                                label: "Root Fragment",
                                variant: InputVariant.counter,
                                counterValue: _teethExtracted,
                                counterMin: 0,
                                counterMax: 32,
                                onCounterChanged: (newValue) {
                                  setState(() {
                                    _teethExtracted = newValue;
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
                                  counterValue: _teethExtracted,
                                  counterMin: 0,
                                  counterMax: 32,
                                  onCounterChanged: (newValue) {
                                    setState(() {
                                      _teethExtracted = newValue;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 64),
                              Expanded(
                                child: InputField(
                                  label: "Filled or Restored",
                                  variant: InputVariant.counter,
                                  counterValue: _teethExtracted,
                                  counterMin: 0,
                                  counterMax: 32,
                                  onCounterChanged: (newValue) {
                                    setState(() {
                                      _teethExtracted = newValue;
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
                  ),

                  const SizedBox(height: 32),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Button(
                          variant: ButtonVariant.secondary,
                          label: "Previous",
                          width: 160,
                          icon: Icons.arrow_back,
                          iconPlacement: IconPlacement.left,
                          onPressed: widget.onPrevious,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Button(
                          label: "Save",
                          width: 140,
                          icon: Icons.save_alt_outlined,
                          iconPlacement: IconPlacement.left,
                          onPressed: widget.onFinish,
                        ),
                      ])
                ],
              ),
            ]),
      ),
    );
  }
}
