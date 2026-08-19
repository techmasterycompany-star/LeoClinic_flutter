import 'package:flutter/material.dart';

class AdminStatisticModel {
  final IconData icon;
  final String headline;
  final String result;
  final int? percentage;

  const AdminStatisticModel({
    required this.icon,
    required this.headline,
    required this.result,
    this.percentage,
  });
}

class AdminAppointmentModel {
  final String patientName;
  final String patientNumber;
  final String doctorName;
  final String speciality;
  final String time;
  final String status;
  final String? patientImage;

  const AdminAppointmentModel({
    required this.patientName,
    required this.patientNumber,
    required this.doctorName,
    required this.speciality,
    required this.time,
    required this.status,
    this.patientImage,
  });
}

class DoctorPerformanceModel {
  final String doctorName;
  final String speciality;
  final int totalAppointments;
  final int appointmentsCompleted;
  final double rate;
  final String? doctorImage;

  const DoctorPerformanceModel({
    required this.doctorName,
    required this.speciality,
    required this.totalAppointments,
    required this.appointmentsCompleted,
    required this.rate,
    this.doctorImage,
  });

  String get rateText => rate.toStringAsFixed(1);
}

class AdminAlertModel {
  final String title;
  final String subTitle;

  const AdminAlertModel({required this.title, required this.subTitle});
}

class AdminOverviewModel {
  final List<AdminStatisticModel> statistics;
  final List<AdminAppointmentModel> todayAppointments;
  final List<DoctorPerformanceModel> doctorPerformance;
  final List<AdminAlertModel> alerts;

  const AdminOverviewModel({
    required this.statistics,
    required this.todayAppointments,
    required this.doctorPerformance,
    required this.alerts,
  });
}

const adminOverviewMock = AdminOverviewModel(
  statistics: [
    AdminStatisticModel(
      icon: Icons.people,
      headline: 'Today\'s Patient',
      result: '32',
      percentage: 8,
    ),
    AdminStatisticModel(
      icon: Icons.medical_services_outlined,
      headline: 'Active doctors',
      result: '12',
      percentage: 3,
    ),
    AdminStatisticModel(
      icon: Icons.euro_outlined,
      headline: 'Clinic Revenue',
      result: '4,000',
      percentage: 12,
    ),
    AdminStatisticModel(
      icon: Icons.edit_calendar_outlined,
      headline: 'Pending Appointments',
      result: '10',
      percentage: 5,
    ),
  ],
  todayAppointments: [
    AdminAppointmentModel(
      patientName: 'Emily Carter',
      patientNumber: '01234567890',
      doctorName: 'Ali',
      speciality: 'Cardiology',
      time: '9:00 PM',
      status: 'Completed',
    ),
    AdminAppointmentModel(
      patientName: 'Mina George',
      patientNumber: '01098765432',
      doctorName: 'Sara',
      speciality: 'Dermatology',
      time: '10:30 AM',
      status: 'Upcoming',
    ),
    AdminAppointmentModel(
      patientName: 'Hana Mostafa',
      patientNumber: '01122334455',
      doctorName: 'Nabil',
      speciality: 'Neurology',
      time: '12:00 PM',
      status: 'In Progress',
    ),
    AdminAppointmentModel(
      patientName: 'Yara Fathy',
      patientNumber: '01566778899',
      doctorName: 'Laila',
      speciality: 'Pediatrics',
      time: '2:45 PM',
      status: 'Cancelled',
    ),
  ],
  doctorPerformance: [
    DoctorPerformanceModel(
      doctorName: 'Sara',
      speciality: 'Cardiologist',
      totalAppointments: 42,
      appointmentsCompleted: 39,
      rate: 4.8,
    ),
    DoctorPerformanceModel(
      doctorName: 'Ali',
      speciality: 'Orthopedist',
      totalAppointments: 36,
      appointmentsCompleted: 31,
      rate: 4.6,
    ),
    DoctorPerformanceModel(
      doctorName: 'Laila',
      speciality: 'Pediatrician',
      totalAppointments: 48,
      appointmentsCompleted: 44,
      rate: 4.9,
    ),
  ],
  alerts: [
    AdminAlertModel(
      title: 'Low inventory',
      subTitle: '3 medicines are below minimum stock.',
    ),
    AdminAlertModel(
      title: 'Pending payments',
      subTitle: '5 invoices need admin review.',
    ),
    AdminAlertModel(
      title: 'Schedule conflict',
      subTitle: '2 doctors have overlapping appointments.',
    ),
  ],
);
