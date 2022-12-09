import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../layout_screens/search_screen.dart';
import '../layout_screens/settings_screen.dart';
import '../providers/data_provider.dart';
import '../widgets/bottom_navigation_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var finished = false;
  @override
  void initState() {
    final serviceData = Provider.of<DataProvider>(context, listen: false);
    serviceData.getServiceData('business');
    serviceData.getServiceData('sports');
    serviceData.getServiceData('science');
    // serviceData.showScreen(0);
    finished = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: data.getScreen['label'] == 'Settings'
            ? const SettingsScreen()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.getScreen['label'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => SearchScreen()));
                          },
                          icon: const Icon(
                            Iconsax.search_normal_14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: data.getScreen['screen'],
                  ),
                ],
              ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
