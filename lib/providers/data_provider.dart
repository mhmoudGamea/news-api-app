import 'package:flutter/material.dart';

import '../services/cache_helper.dart';
import '../layout_screens/business_screen.dart';
import '../layout_screens/science_screen.dart';
import '../layout_screens/settings_screen.dart';
import '../layout_screens/sports_screen.dart';
import '../services/news_service.dart';

class DataProvider with ChangeNotifier {
  var _currentIndex = 0;

  int get getIndex {
    return _currentIndex;
  }

  Map<String, dynamic> _myScreen = {'label': 'Business', 'screen': const BusinessScreen()};

  Map<String, dynamic> get getScreen {
    return _myScreen;
  }

  final List<Map<String, dynamic>> _screens = [
    {'label': 'Business', 'screen': const BusinessScreen()},
    {'label': 'Sports', 'screen': const SportsScreen()},
    {'label': 'Science', 'screen': const ScienceScreen()},
    {'label': 'Settings', 'screen': const SettingsScreen()},
  ];

  void showScreen(int value) {
    _currentIndex = value;
    _myScreen = _screens.elementAt(value);
    notifyListeners();
  }

  // -------------------- start get business, sports, science news --------------------
  Map<String, dynamic> _business = {};
  Map<String, dynamic> _sports = {};
  Map<String, dynamic> _science = {};

  // use this function in didChangeDependencies
  Future<void> getServiceData(String category) async {
    if (category == 'business') {
      _business = await NewsService.getData(category);
    } else if (category == 'sports') {
      _sports = await NewsService.getData(category);
    } else if (category == 'science') {
      _science = await NewsService.getData(category);
    }
    notifyListeners();
  }

  Map<String, dynamic> get getBusiness {
    return _business;
  }

  Map<String, dynamic> get getSports {
    return _sports;
  }

  Map<String, dynamic> get getScience {
    return _science;
  }
  // ------------------------ change theme mode ------------------------------
  var isDark = false;

  void changeTheme({bool? value}) async{
    if(value != null) {
      isDark = value;
    }else {
    isDark = !isDark;
    await CacheHelper.cacheData(key: 'isDark', value: isDark);
    notifyListeners();
    }
  }

  // ------------------------ start search screen ----------------------------
  Map<String, dynamic> _search = {};

  Future<void> getSearchedData(String value) async {
    _search = await NewsService.search(value);
    notifyListeners();
  }

  Map<String, dynamic> get getSearch {
    return _search;
  }
}
