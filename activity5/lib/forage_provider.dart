import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ForageProvider with ChangeNotifier {
  //variables
  var _name = TextEditingController();
  var _location = TextEditingController();
  var _isInSeason = false;
  var _notes = TextEditingController();

  //getters for private variables
  TextEditingController get getName => _name;
  TextEditingController get getLocation => _location;
  TextEditingController get getNotes => _notes;
  bool? get getInSeason => _isInSeason;

  List<Map<String, dynamic>> dataList = [];

  List<Map<String, dynamic>> get getForageList => dataList;

  void clear() {
    _name.clear();
    _location.clear();
    _notes.clear();
    _isInSeason = false;
    notifyListeners();
  }

  void isInSeason(bool? updateSeasonValue) {
    _isInSeason = updateSeasonValue ?? false;
    notifyListeners();
  }

  void save() {
    Map<String, dynamic> newData = {
      'name': _name.text,
      'location': _location.text,
      'isInSeason': _isInSeason,
      'notes': _notes.text,
    };

    dataList.add(newData);
    notifyListeners();
    clear();
  }
}
