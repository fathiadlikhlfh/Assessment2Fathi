import 'package:flutter/material.dart';
import '../model/transaksi.dart';
import '../model/tukang_ojek.dart';

class TransaksiProvider with ChangeNotifier {
  List<Transaksi> _transaksiList = [];

  List<Transaksi> get transaksiList => _transaksiList;

  void addTransaksi(Transaksi transaksi, List<TukangOjek> tukangOjekList) {
    _transaksiList.add(transaksi);

    // Update jumlah order dan omzet pada tukang ojek
    TukangOjek tukangOjek = tukangOjekList.firstWhere((tukangOjek) => tukangOjek.id == transaksi.tukangOjekId);
    tukangOjek.jumlahOrder++;
    tukangOjek.omzet += transaksi.harga;

    notifyListeners();
  }
}