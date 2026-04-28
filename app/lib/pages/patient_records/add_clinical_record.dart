import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';

class AddClinicalRecordForm extends StatefulWidget {
  final VoidCallback onFinish;
  const AddClinicalRecordForm({super.key, required this.onFinish});

  @override
  State<AddClinicalRecordForm> createState() => _AddClinicalRecordFormState();
}

class _AddClinicalRecordFormState extends State<AddClinicalRecordForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Button(
        label: "Next",
        width: double.infinity,
        icon: Icons.arrow_forward,
        iconPlacement: IconPlacement.right,
        onPressed: widget.onFinish,
      ),
    );
  }
}
