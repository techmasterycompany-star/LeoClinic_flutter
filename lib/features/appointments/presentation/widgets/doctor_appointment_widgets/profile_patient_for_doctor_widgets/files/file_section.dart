import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/files/widgets/file_card.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/doctor_appointment_widgets/profile_patient_for_doctor_widgets/header_of_sections.dart';

class FileSection extends StatefulWidget {
  const FileSection({super.key});

  @override
  State<FileSection> createState() => _FileSectionState();
}

class _FileSectionState extends State<FileSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5 , vertical: 10),
      child: Column(
        children: [
          HeaderOfPrescriptionSection(title: "File", subtitle: "See all",),
          FileItemCard(title: 'Periapical X-ray', onDownload: () {  }, onDelete: () { },)
        ],
      ),
    );
  }
}