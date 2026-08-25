import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/features/doctor/presentation/widgets/filter_bottom.dart';

class Filterbottomreuse extends StatefulWidget {
  const Filterbottomreuse({super.key});

  @override
  State<Filterbottomreuse> createState() => _FilterbottomreuseState();
}

class _FilterbottomreuseState extends State<Filterbottomreuse> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        SizedBox(width: width * 0.03),
        Filterbottom(
          text: "Requests",
          isselecleted: selectedIndex == 1,
          ontap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        SizedBox(width: width * 0.03),
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
