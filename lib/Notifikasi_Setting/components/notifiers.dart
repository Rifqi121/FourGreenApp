import 'package:flutter/cupertino.dart';
import 'package:fourgreen/Notifikasi_Setting/components/singleRadioButton.dart';

class SingleNotifier extends ChangeNotifier{
  String _currentNada = nada[0];
  SingleNotifier();

  String get currentNada => _currentNada;

  updatePilihan(String value) {
    if(value != _currentNada) {
      _currentNada = value;
      notifyListeners();
    }
  }
}

class SingleNotifierGetar extends ChangeNotifier{
  String _currentGetar = getar[0];
  SingleNotifierGetar();

  String get currentGetar => _currentGetar;

  updateGetar(String value) {
    if(value != _currentGetar) {
      _currentGetar = value;
      notifyListeners();
    }
  }
}

class SingleNotifierPop extends ChangeNotifier{
  String _currentPop = pop[0];
  SingleNotifierPop();

  String get currentPop => _currentPop;

  updatePop(String value) {
    if(value != _currentPop) {
      _currentPop = value;
      notifyListeners();
    }
  }
}

class SingleNotifierTerang extends ChangeNotifier{
  String _currentTerang = terang[0];
  SingleNotifierTerang();

  String get currentTerang => _currentTerang;

  updateTerang(String value) {
    if(value != _currentTerang) {
      _currentTerang = value;
      notifyListeners();
    }
  }
}