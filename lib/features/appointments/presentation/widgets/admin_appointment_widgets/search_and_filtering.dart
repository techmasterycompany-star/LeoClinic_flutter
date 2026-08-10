import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/widgets/filtering.dart';
import 'package:leoclinic_flutter/core/widgets/search_field.dart';

class SearchAndFiltering extends StatelessWidget {
  const SearchAndFiltering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchField()),
        SizedBox(width: 14),
        Filter(),
      ],
    );
  }
}




