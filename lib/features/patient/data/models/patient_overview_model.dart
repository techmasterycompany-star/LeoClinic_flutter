class PatientAppointmentModel {
  final String doctorName;
  final int doctorAge;
  final String doctorGender;
  final String appointmentTime;
  final String appointmentDate;
  final String location;
  final String? doctorImage;

  const PatientAppointmentModel({
    required this.doctorName,
    required this.doctorAge,
    required this.doctorGender,
    required this.appointmentTime,
    required this.appointmentDate,
    required this.location,
    this.doctorImage,
  });
}

class CaringSpecialistModel {
  final String doctorName;
  final String speciality;
  final double amount;
  final String? doctorImage;

  const CaringSpecialistModel({
    required this.doctorName,
    required this.speciality,
    required this.amount,
    this.doctorImage,
  });
}

class PatientOverviewModel {
  final List<PatientAppointmentModel> nextAppointments;
  final List<CaringSpecialistModel> caringSpecialists;

  const PatientOverviewModel({
    required this.nextAppointments,
    required this.caringSpecialists,
  });

  int get availableDoctorsThisWeek => caringSpecialists.length;
}

const patientOverviewMock = PatientOverviewModel(
  nextAppointments: [
    PatientAppointmentModel(
      doctorName: 'Sarah Legend',
      doctorAge: 24,
      doctorGender: 'Female',
      appointmentTime: '8:00 PM',
      appointmentDate: '2026-08-27',
      location: 'Visit',
    ),
  ],
  caringSpecialists: [
    CaringSpecialistModel(
      doctorName: 'Dr. Mohamed Gamal',
      speciality: 'Dermatologist',
      amount: 80,
    ),
    CaringSpecialistModel(
      doctorName: 'Dr. Sara Ali',
      speciality: 'Cardiologist',
      amount: 120,
    ),
    CaringSpecialistModel(
      doctorName: 'Dr. Ahmed Nabil',
      speciality: 'Neurologist',
      amount: 150,
    ),
    CaringSpecialistModel(
      doctorName: 'Dr. Laila Samir',
      speciality: 'Pediatrician',
      amount: 90,
    ),
  ],
);
