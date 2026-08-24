class AppointmentReceiptCard  {
  final String dept;
  final String doctorname;
  final String date;
  final String time;
  final String package;
  final String patientName;
  final String age;
  final String gender;
  final double fee;
  final double tax;

  const AppointmentReceiptCard({
    required this.date,
    required this.time,
    required this.package,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.fee,
    required this.tax, required this.doctorname, required this.dept,
  });
}