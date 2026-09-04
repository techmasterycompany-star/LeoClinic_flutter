import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/Filter-bottom.dart';

class Filterbottomreuse extends StatefulWidget {
  const Filterbottomreuse({super.key});

  @override
  State<Filterbottomreuse> createState() => _FilterbottomreuseState();
}

class _FilterbottomreuseState extends State<Filterbottomreuse> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Filterbottom(
          text: "All",
          isselecleted: selectedIndex == 0,
          ontap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        SizedBox(width: 12.w),
        Filterbottom(
          text: "Requests",
          isselecleted: selectedIndex == 1,
          ontap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        SizedBox(width: 12.w),
        Filterbottom(
          text: "Canceled",
          isselecleted: selectedIndex == 2,
          ontap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
        ),
      ],
    );
  }
}
