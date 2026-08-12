import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/utils/responsive.dart';

class AnalysisAppointmentCard extends StatelessWidget {
final int index ;
  const AnalysisAppointmentCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: index ==0 || index == 2 ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(right: 20),
     height: Responsive.value(context, mobile: 130, tablet: 150),
     width: Responsive.value(context, mobile: 200, tablet: 200),
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(12),
       boxShadow: [
         BoxShadow(
           color: Colors.grey.withValues(alpha: 0.5),
           spreadRadius: 1,
           blurRadius: 2,
         ),
       ],
     ),
     child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               height: Responsive.value(context, mobile: 40, tablet: 45),
               width: Responsive.value(context, mobile: 40, tablet: 45),
               decoration: BoxDecoration(
                 color: Color(0xffE5F1FF),
                 borderRadius: BorderRadius.circular(12),
               ),
               child: SvgPicture.asset('assets/icons/notification-02.svg',fit: BoxFit.scaleDown,),
             ),
             Row(
               children: [
                 SvgPicture.asset('assets/icons/arrow-up-right-01.svg',fit: BoxFit.scaleDown,),
                 SizedBox(width: 5,),
                 Text('+12.5%',style: AppTextStyle.textstyle10.copyWith(color: Color(0xff00B517)),
                 )
               ],
             )
           ],
         ),
         SizedBox(height: 12,),
         Text('Appointments',style: AppTextStyle.textstyle12.copyWith(color: Color(0xff1A1A1A)),),
         SizedBox(height: 2,),
         Text('1,500',style: AppTextStyle.textstyle14.copyWith(color:AppColors.surfaceDark),)
       ],),
     ),
                    );
  }
}
