import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';

class StatusOfCards {
  final AppointmentStatus status;

  const StatusOfCards(this.status);

Color get cardcolor {
  switch (status) {
    case AppointmentStatus.confirmed:
      return AppColors.successBg;
    case AppointmentStatus.canceled:
      return AppColors.fieldBg;
  }
}

Color get textColor {
  switch (status) {
    case AppointmentStatus.confirmed:
      return AppColors.success;
    case AppointmentStatus.canceled:
      return AppColors.failed;
  }
}
  String get label {
    switch (status) {
      case AppointmentStatus.confirmed:
        return "Confirmed";
      case AppointmentStatus.canceled:
        return "Canceled";
    }
  }
}