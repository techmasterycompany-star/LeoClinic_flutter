
import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';
import 'package:leoclinic_flutter/features/appointments/presentation/widgets/admin_appointment_widgets/details_dashboard/analysis_card_of_appointment.dart';

class DetilasDashboard extends StatelessWidget {
  const DetilasDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.value(context, mobile:270, tablet: 400),
      width: Responsive.value(context, mobile: 400, tablet: 800),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,mainAxisSpacing: 14,crossAxisSpacing: 14,childAspectRatio:
        Responsive.value(context, mobile: 1.7, tablet: 1.5)
      ),
      itemCount: 4,
       itemBuilder: (context, index) => AnalysisAppointmentCard(index: index,
       )),
    );
  }
}
