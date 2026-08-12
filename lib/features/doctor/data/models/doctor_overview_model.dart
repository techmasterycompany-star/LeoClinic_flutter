class DoctorAppointmentModel {
  final String patientName;
  final int patientAge;
  final String patientGender;
  final String appointmentTime;
  final String appointmentDate;
  final String location;
  final String? patientImage;

  const DoctorAppointmentModel({
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.appointmentTime,
    required this.appointmentDate,
    required this.location,
    this.patientImage,
  });
}

class DoctorRequestModel {
  final String patientName;
  final int patientAge;
  final String patientGender;
  final String appointmentDate;
  final String location;
  final String? patientImage;

  const DoctorRequestModel({
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.appointmentDate,
    required this.location,
    this.patientImage,
  });
}

class DoctorOverviewModel {
  final List<DoctorAppointmentModel> nextAppointments;
  final List<DoctorAppointmentModel> todayAppointments;
  final List<DoctorRequestModel> newRequests;

  const DoctorOverviewModel({
    required this.nextAppointments,
    required this.todayAppointments,
    required this.newRequests,
  });
}

const doctorOverviewMock = DoctorOverviewModel(
  nextAppointments: [
    DoctorAppointmentModel(
      patientName: 'Sarah',
      patientAge: 25,
      patientGender: 'Female',
      appointmentTime: '10:00 AM',
      appointmentDate: '2026-08-12',
      location: 'Online',
    ),
    DoctorAppointmentModel(
      patientName: 'Omar Hassan',
      patientAge: 34,
      patientGender: 'Male',
      appointmentTime: '11:30 AM',
      appointmentDate: '2026-08-12',
      location: 'Clinic',
    ),
    DoctorAppointmentModel(
      patientName: 'Mariam Adel',
      patientAge: 29,
      patientGender: 'Female',
      appointmentTime: '1:00 PM',
      appointmentDate: '2026-08-13',
      location: 'Online',
    ),
  ],
  todayAppointments: [
    DoctorAppointmentModel(
      patientName: 'Sarah',
      patientAge: 25,
      patientGender: 'Female',
      appointmentTime: '10:00 AM',
      appointmentDate: '2026-08-12',
      location: 'Online',
    ),
    DoctorAppointmentModel(
      patientName: 'Youssef Ali',
      patientAge: 41,
      patientGender: 'Male',
      appointmentTime: '3:30 PM',
      appointmentDate: '2026-08-12',
      location: 'Clinic',
    ),
  ],
  newRequests: [
    DoctorRequestModel(
      patientName: 'Nour Ahmed',
      patientAge: 22,
      patientGender: 'Female',
      appointmentDate: '2026-08-14',
      location: 'Online',
    ),
    DoctorRequestModel(
      patientName: 'Karim Samir',
      patientAge: 38,
      patientGender: 'Male',
      appointmentDate: '2026-08-15',
      location: 'Clinic',
    ),
  ],
);
