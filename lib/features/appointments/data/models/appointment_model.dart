
import 'package:flutter/material.dart';

enum AppointmentStatus { confirmed, canceled, followup , newvisit }

class AppointmentModel {
  final String? doctorName;
  final String? specialty;
  final String? patientName;
  final String? age;
  final String date;
  final String time;
  final String location;
  final AppointmentStatus status;
  final String doctorImageUrl;

  AppointmentModel({
     this.doctorName,
     this.specialty,
    this.patientName,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.doctorImageUrl,
    this.age,
  });
}
