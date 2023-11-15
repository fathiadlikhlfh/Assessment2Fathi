import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/halaman_utama.dart';
import 'pages/form_tambah_tukang_ojek.dart';
import 'pages/form_tambah_transaksi.dart';
import 'provider/tukang_ojek_provider.dart';
import 'provider/transaksi_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TukangOjekProvider()),
        ChangeNotifierProvider(create: (_) => TransaksiProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HalamanUtama(),
          '/formTambahTukangOjek': (context) => FormTambahTukangOjek(),
          '/formTambahTransaksi': (context) => FormTambahTransaksi(),
        },
      ),
    );
  }
}