import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/book_appointment.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/select_type_of_visit.dart';

import 'package:leoclinic_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/signup_screen.dart';

import 'package:leoclinic_flutter/features/admin/presentation/pages/admin_main.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/pages/doctor_main.dart';
import 'package:leoclinic_flutter/features/patient/presentation/pages/patient_main.dart';

import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_add_prescription.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/doctor_request.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/pick_a_slot_screen_for_patient.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/doctor/profile_patient_for_doctor.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/pages/patient/patient_appointment.dart';

final GoRouter router = GoRouter(
  initialLocation: '/BookAppointment',
  routes: [
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),

    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignupScreen();
      },
    ),

    GoRoute(
      path: '/admin',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminMainScreen();
      },
    ),

    GoRoute(
      path: '/doctor',
      builder: (BuildContext context, GoRouterState state) {
        return const DoctorMainScreen();
      },
    ),

    GoRoute(
      path: '/patient',
      builder: (BuildContext context, GoRouterState state) {
        return const PatientMainScreen();
      },
    ),

    GoRoute(
      path: '/ProfilePatientForDoctor',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePatientForDoctor();
      },
    ),

    GoRoute(
      path: '/DoctorAddPrescription',
      builder: (BuildContext context, GoRouterState state) {
        return const DoctorAddPrescription();
      },
    ),

    GoRoute(
      path: '/DoctorRequestAppointment',
      builder: (BuildContext context, GoRouterState state) {
        return const DoctorRequestAppointment();
      },
    ),

    GoRoute(
      path: '/PickAslotScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const PickAslotScreen();
      },
    ),
    GoRoute(
      path: '/PatientAppointment',
      builder: (BuildContext context, GoRouterState state) {
        return const PatientAppointment();
      },
    ),
      GoRoute(
      path: '/BookAppointment',
      builder: (BuildContext context, GoRouterState state) {
        return const BookAppointment();
      },
    ),
        GoRoute(
      path: '/SelectTypeOfVisitScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectTypeOfVisitScreen();
      },
    ),
  ],
);
