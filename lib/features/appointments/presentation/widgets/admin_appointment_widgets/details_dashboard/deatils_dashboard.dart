
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/details_dashboard/analysis_card_of_appointment.dart';

class DetilasDashboard extends StatelessWidget {
  const DetilasDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ScreenUtil().screenWidth < 600;
    return SizedBox(
      height: isMobile ? 270.h : 400.h,
      width: isMobile ? 400.w : 800.w,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14.h,
          crossAxisSpacing: 14.w,
          childAspectRatio: isMobile ? 1.7 : 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => AnalysisAppointmentCard(index: index),
      ),
    );
  }
}
