import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/data_provider.dart';

class CustomRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: data.isDark ? Colors.white10 : secondaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            data.isDark ? 'assets/images/sun.svg' : 'assets/images/moon.svg',
            color: data.isDark ? Colors.grey : primaryColor,
            width: 25,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Dark Mode',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Spacer(),
        Switch(
          value: data.isDark,
          onChanged: (value) {
            data.changeTheme();
          },
          activeColor: data.isDark
              ? Theme.of(context).scaffoldBackgroundColor
              : secondaryColor,
          inactiveThumbColor: secondaryColor,
          inactiveTrackColor: secondaryColor.withOpacity(0.2),
        ),
      ],
    );
  }
}
