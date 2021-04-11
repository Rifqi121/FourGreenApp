import 'package:flutter/cupertino.dart';
import 'package:fourgreen/Privacy/components/singleRadioButton.dart';

class SingleNotifierPrivacy extends ChangeNotifier{
  String _currentFoto = foto[0];
  SingleNotifierPrivacy();

  String get currentFoto => _currentFoto;

  updatePilihan(String value) {
    if(value != _currentFoto) {
      _currentFoto = value;
      notifyListeners();
    }
  }
}

class SingleNotifierInfo extends ChangeNotifier{
  String _currentInfo = info[0];
  SingleNotifierInfo();

  String get currentInfo => _currentInfo;

  updateInfo(String value) {
    if(value != _currentInfo) {
      _currentInfo = value;
      notifyListeners();
    }
  }
}

class SingleNotifierStatus extends ChangeNotifier{
  String _currentStatus = status[0];
  SingleNotifierStatus();

  String get currentInfo => _currentStatus;

  updateStatus(String value) {
    if(value != _currentStatus) {
      _currentStatus = value;
      notifyListeners();
    }
  }
}

class SingleNotifierForum extends ChangeNotifier{
  String _currentForum = forum[0];
  SingleNotifierForum();

  String get currentForum => _currentForum;

  updateForum(String value) {
    if(value != _currentForum) {
      _currentForum = value;
      notifyListeners();
    }
  }
}

class SingleNotifierClub extends ChangeNotifier{
  String _currentClub = club[0];
  SingleNotifierClub();

  String get currentClub => _currentClub;

  updateClub(String value) {
    if(value != _currentClub) {
      _currentClub = value;
      notifyListeners();
    }
  }
}
