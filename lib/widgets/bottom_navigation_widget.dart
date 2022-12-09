import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

import '../constants.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(top: BorderSide(width: 1.2,color: data.isDark ? const Color(0xff3f444c) : whiteColor)),
      ),
      child: BottomNavigationBar(
        currentIndex: data.getIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (value) {
          data.showScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.bag_2),
              label: 'Business'
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.cup),
              label: 'Sports'
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.award),
              label: 'Science'
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.setting),
              label: 'Setting'
          ),
        ],
      ),
    );
  }
}
