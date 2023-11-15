import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tukang_ojek_provider.dart';
import '../model/tukang_ojek.dart';

class FormTambahTukangOjek extends StatelessWidget {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nopolController = TextEditingController();

  FormTambahTukangOjek({super.key});

  @override
  Widget build(BuildContext context) {
    var tukangOjekProvider = Provider.of<TukangOjekProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tukang Ojek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Tukang Ojek'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nopolController,
              decoration: InputDecoration(labelText: 'NoPol'),
            ),
            SizedBox(height: 16),
            ElevatedButton( // Ganti RaisedButton dengan ElevatedButton
              onPressed: () {
                // Validasi dan simpan tukang ojek
                String nama = _namaController.text;
                String nopol = _nopolController.text;

                if (nama.isNotEmpty && nopol.isNotEmpty) {
                  // Simpan data menggunakan tukangOjekProvider
                  tukangOjekProvider.addTukangOjek(TukangOjek(
                    nama: nama,
                    nopol: nopol,
                  ));

                  // Kembali ke halaman utama
                  Navigator.pop(context);
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}