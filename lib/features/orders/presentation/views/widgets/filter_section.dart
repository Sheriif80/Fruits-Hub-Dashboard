import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/filter.svg", height: 25, width: 25),
          const SizedBox(width: 16),
          const Text('Filter', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
