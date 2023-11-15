import 'package:flutter/material.dart';
import '../model/tukang_ojek.dart';

class TukangOjekProvider extends ChangeNotifier {
  List <TukangOjek> _tukangOjekList = [];

  List<TukangOjek> get tukangOjekList => _tukangOjekList;

  void addTukangOjek(TukangOjek tukangOjek) {
    _tukangOjekList.add(tukangOjek);
    notifyListeners();
  }
}