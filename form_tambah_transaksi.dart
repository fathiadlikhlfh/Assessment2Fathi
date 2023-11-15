import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/transaksi_provider.dart';
import '../provider/tukang_ojek_provider.dart';
import '../model/transaksi.dart';

class FormTambahTransaksi extends StatefulWidget {
  const FormTambahTransaksi({super.key});

  @override
  _FormTambahTransaksiState createState() => _FormTambahTransaksiState();
}

class _FormTambahTransaksiState extends State<FormTambahTransaksi> {
  final TextEditingController _hargaController = TextEditingController();
  String? _selectedTukangOjek;

  @override
  Widget build(BuildContext context) {
    var transaksiProvider = Provider.of<TransaksiProvider>(context);
    var tukangOjekProvider = Provider.of<TukangOjekProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: _selectedTukangOjek,
              onChanged: (String? value) {
                setState(() {
                  _selectedTukangOjek = value;
                });
              },
              items: tukangOjekProvider.tukangOjekList
                  .map((tukangOjek) => DropdownMenuItem(
                value: tukangOjek.nama,
                child: Text(tukangOjek.nama),
              ))
                  .toList(),
              decoration: InputDecoration(labelText: 'List Tukang Ojek'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga Tukang Ojek'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String? tukangOjekNama = _selectedTukangOjek;
                String hargaText = _hargaController.text;

                if (tukangOjekNama != null && hargaText.isNotEmpty) {
                  int harga = int.parse(hargaText);
                  int tukangOjekId = tukangOjekProvider.tukangOjekList
                      .firstWhere((tukangOjek) => tukangOjek.nama == tukangOjekNama)
                      .id!;

                  // Tambahkan transaksi dengan memberikan tukangOjekList
                  transaksiProvider.addTransaksi(
                    Transaksi(
                      tukangOjekId: tukangOjekId,
                      harga: harga,
                      timestamp: DateTime.now().toIso8601String(),
                    ),
                    tukangOjekProvider.tukangOjekList,
                  );

                  // Navigasi ke halaman utama
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}