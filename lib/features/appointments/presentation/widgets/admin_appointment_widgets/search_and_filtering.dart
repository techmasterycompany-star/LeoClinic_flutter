import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/widgets/filtering.dart';
import 'package:leoclinic_flutter/core/widgets/search_field.dart';

class SearchAndFiltering extends StatelessWidget {
  final String hinttext;
  const SearchAndFiltering({
    super.key, required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchField(hinttext: hinttext,)),
        SizedBox(width: 14.w),
        const Filter(),
      ],
    );
  }
}




