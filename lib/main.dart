import 'package:flutter/material.dart';
import 'package:news_app/services/cache_helper.dart';
import 'package:provider/provider.dart';

import './constants.dart';
import './providers/data_provider.dart';
import './screens/news_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? sharedData = CacheHelper.getCachedData(key: 'isDark');
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider()..changeTheme(value: sharedData),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: primaryColor, elevation: 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: whiteColor,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          subtitle1: TextStyle(fontSize: 14, color: whiteColor, letterSpacing: 1.1),
        ),
        scaffoldBackgroundColor: primaryColor,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: const Color(0xff333842),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff2a2d32), elevation: 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff333842),
          elevation: 0,
          selectedItemColor: Color(0xff111316),
          unselectedItemColor: Color(0xff3f444c),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          subtitle1: TextStyle(fontSize: 14, color: Colors.white, letterSpacing: 1.1),
        ),
        scaffoldBackgroundColor: const Color(0xff2a2d32),
      ),
      themeMode: Provider.of<DataProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      home: const NewsScreen(),
    );
  }
}
