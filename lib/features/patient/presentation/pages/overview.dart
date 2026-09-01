import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/network/dio_client.dart';
import 'package:leoclinic_flutter/core/widgets/app_list_view.dart';
import 'package:leoclinic_flutter/features/doctor/data/datasource/doctor_api_services.dart';
import 'package:leoclinic_flutter/features/doctor/data/models/doctor_model.dart';
import 'package:leoclinic_flutter/features/patient/data/models/patient_overview_model.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/appbar.dart';
import 'package:leoclinic_flutter/features/patient/presentation/widgets/patient_request_history.dart';

import '../widgets/patient_caring_specialist.dart';
import '../widgets/patient_next_appointment_card.dart';

class PatientOverview extends StatefulWidget {
  final PatientOverviewModel overview;

  const PatientOverview({super.key, this.overview = patientOverviewMock});

  @override
  State<PatientOverview> createState() => _PatientOverviewState();
}

class _PatientOverviewState extends State<PatientOverview> {
  bool nextAppointmentView = false;
  bool requestHistoryView = false;

  final DoctorApiServices _doctorApiServices = DoctorApiServices(DioClient());
  List<DoctorModel>? _doctors;
  bool _loadingDoctors = true;

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    try {
      final doctors = await _doctorApiServices.searchDoctors();
      if (mounted) {
        setState(() {
          _doctors = doctors;
          _loadingDoctors = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _doctors = null;
          _loadingDoctors = false;
        });
      }
    }
  }

  List<CaringSpecialistModel> get _caringSpecialists {
    final doctors = _doctors;
    if (doctors == null) return const [];
    return doctors.map((doctor) {
      return CaringSpecialistModel(
        doctorName: doctor.name,
        speciality: doctor.speciality,
        amount: doctor.consultationFee ?? 0,
        doctorImage: doctor.image,
      );
    }).toList();
  }

  Widget headline(String headline) {
    return Text(
      headline,
      style: AppTextStyle.textstyle14.copyWith(fontSize: 16),
    );
  }

  Widget _buildEmptyState(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          message,
          style: AppTextStyle.secondarytext,
        ),
      ),
    );
  }

  void _toggleNextAppointment() {
    setState(() {
      nextAppointmentView = !nextAppointmentView;
    });
  }

  void _toggleRequestHistory() {
    setState(() {
      requestHistoryView = !requestHistoryView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PatientAppBar(),

        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Next Appointment'),
                  TextButton(
                    onPressed: _toggleNextAppointment,
                    child: Text('View all'),
                  ),
                ],
              ),
              widget.overview.nextAppointments.isEmpty
                  ? _buildEmptyState('No appointments available')
                  : AppListView(
                      itemCount: nextAppointmentView
                          ? widget.overview.nextAppointments.length
                          : 1,
                      itemBuilder: (context, index) {
                        final appointment =
                            widget.overview.nextAppointments[index];

                        return GestureDetector(
                          onTap: () {
                            context.push('/BookAppointment');
                          },
                          child: NextAppointmentCard(
                            doctorName: appointment.doctorName,
                            doctorAge: appointment.doctorAge,
                            doctorGender: appointment.doctorGender,
                            appointmentTime: appointment.appointmentTime,
                            appointmentDate: appointment.appointmentDate,
                            location: appointment.location,
                            doctorImage: appointment.doctorImage,
                          ),
                        );
                      },
                    ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Caring specialist'),
                  Text(
                    _loadingDoctors
                        ? 'Loading doctors...'
                        : '${_caringSpecialists.length} doctors available this week',
                    style: AppTextStyle.secondarytext,
                  ),
                ],
              ),
              _caringSpecialists.isEmpty
                  ? _buildEmptyState('No caring specialists available')
                  : AppListView(
                      itemCount: _caringSpecialists.length,
                      itemBuilder: (context, index) {
                        final specialist = _caringSpecialists[index];

                        return GestureDetector(
                          onTap: () {
                            context.push('/BookAppointment');
                          },
                          child: CaringSpecialistCard(
                            doctorName: specialist.doctorName,
                            speciality: specialist.speciality,
                            amount: specialist.amount,
                            doctorImage: specialist.doctorImage,
                          ),
                        );
                      },
                    ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  headline('Request History'),
                  TextButton(
                    onPressed: _toggleRequestHistory,
                    child: Text('See all'),
                  ),
                ],
              ),
              widget.overview.requestsHistory.isEmpty
                  ? _buildEmptyState('No request history')
                  : AppListView(
                      itemCount: requestHistoryView
                          ? widget.overview.requestsHistory.length
                          : 1,
                      itemBuilder: (context, index) {
                        final request =
                            widget.overview.requestsHistory[index];

                        return RequestHistoryCard(
                          doctorName: request.doctorName,
                          speciality: request.speciality,
                          appointmentDate: request.appointmentDate,
                          appointmentTime: request.appointmentTime,
                          location: request.location,
                          appointmentStatus: request.appointmentStatus,
                          doctorImage: request.doctorImage,
                        );
                      },
                    ),
            ]),
          ),
        ),
      ],
    );
  }
}
