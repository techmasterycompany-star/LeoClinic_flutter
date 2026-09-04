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

class PatientRequestHistoryModel {
  final String doctorName;
  final String speciality;
  final String appointmentDate;
  final String appointmentTime;
  final String location;
  final String appointmentStatus;
  final String? doctorImage;

  const PatientRequestHistoryModel({
    required this.doctorName,
    required this.speciality,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.location,
    required this.appointmentStatus,
    this.doctorImage,
  });
}

class PatientOverviewModel {
  final List<PatientAppointmentModel> nextAppointments;
  final List<CaringSpecialistModel> caringSpecialists;
  final List<PatientRequestHistoryModel> requestsHistory;

  const PatientOverviewModel({
    required this.nextAppointments,
    required this.caringSpecialists,
    required this.requestsHistory,
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
    PatientAppointmentModel(
      doctorName: 'Mohamed Gamal',
      doctorAge: 30,
      doctorGender: 'Male',
      appointmentTime: '10:00 AM',
      appointmentDate: '2026-08-28',
      location: 'Online',
    ),
    PatientAppointmentModel(
      doctorName: 'Sara Ali',
      doctorAge: 28,
      doctorGender: 'Female',
      appointmentTime: '2:00 PM',
      appointmentDate: '2026-08-29',
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
  requestsHistory: [
    PatientRequestHistoryModel(
      doctorName: 'Dr Ahmed',
      speciality: 'Child psychologist',
      appointmentDate: '27-8-2026',
      appointmentTime: '8:00 PM',
      location: 'online',
      appointmentStatus: 'Approved',
    ),
    PatientRequestHistoryModel(
      doctorName: 'Dr Asser',
      speciality: 'Child psychologist',
      appointmentDate: '27-8-2026',
      appointmentTime: '9:00 PM',
      location: 'online',
      appointmentStatus: 'Cancelled',
    ),
    PatientRequestHistoryModel(
      doctorName: 'Dr Omar',
      speciality: 'Child psychologist',
      appointmentDate: '27-8-2026',
      appointmentTime: '3:00 PM',
      location: 'online',
      appointmentStatus: 'Approved',
    ),
  ],
);
