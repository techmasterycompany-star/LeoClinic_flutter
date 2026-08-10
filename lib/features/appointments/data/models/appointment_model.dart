
enum AppointmentStatus { confirmed, canceled, }

class AppointmentModel {
  final String doctorName;
  final String specialty;
  final String? patientName;
  final String date;
  final String time;
  final String location;
  final AppointmentStatus status;
  final String doctorImageUrl;

  AppointmentModel({
    required this.doctorName,
    required this.specialty,
    this.patientName,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.doctorImageUrl,
  });
}
