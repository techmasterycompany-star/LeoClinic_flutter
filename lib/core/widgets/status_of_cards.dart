import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/features/appointments/data/models/appointment_model.dart';

class StatusOfCards {
  final AppointmentStatus status;

  const StatusOfCards(this.status);

Color get cardcolor {
  switch (status) {
    case AppointmentStatus.confirmed:
      return AppColors.background;
    case AppointmentStatus.canceled:
      return AppColors.fieldBg;
    case AppointmentStatus.followup:
      return AppColors.background;
    case AppointmentStatus.newvisit:
     return AppColors.background;
  }
}

Color get textColor {
  switch (status) {
    case AppointmentStatus.confirmed:
      return AppColors.success;
    case AppointmentStatus.canceled:
      return AppColors.failed;
      case AppointmentStatus.newvisit:
      return AppColors.success;
    case AppointmentStatus.followup:
      return AppColors.failed;
  }
}
  String get label {
    switch (status) {
      case AppointmentStatus.confirmed:
        return "Confirmed";
      case AppointmentStatus.canceled:
        return "Canceled";
      case AppointmentStatus.newvisit:
      return "New Visit";
    case AppointmentStatus.followup:
      return "Follow-Up";
    }
  }

  Color get statuscoloroflabel {
  switch (status) {
    case AppointmentStatus.confirmed:
      return AppColors.successBg;
    case AppointmentStatus.canceled:
      return AppColors.fieldBg;
    case AppointmentStatus.followup:
       return AppColors.fieldBg;
    case AppointmentStatus.newvisit:
    return AppColors.successBg;
  }
}
}