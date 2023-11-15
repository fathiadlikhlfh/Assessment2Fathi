import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tukang_ojek_provider.dart';
import '../model/tukang_ojek.dart';

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tukangOjekProvider = Provider.of<TukangOjekProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PANGKALAN'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tukangOjekProvider.tukangOjekList.length,
              itemBuilder: (context, index) {
                TukangOjek tukangOjek = tukangOjekProvider.tukangOjekList[index];
                return ListTile(
                  title: Text(tukangOjek.nama),
                  subtitle: Text('Jumlah Orderan: ${tukangOjek.jumlahOrder} | Omset: ${tukangOjek.omzet}'),
                  onTap: () {
                    // Tambahkan logika untuk menampilkan detail atau navigasi ke halaman lain
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Navigasi ke halaman tambah tukang ojek
              Navigator.pushNamed(context, '/formTambahTukangOjek');
            },
            child: Icon(Icons.person_add),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              // Navigasi ke halaman tambah transaksi
              Navigator.pushNamed(context, '/formTambahTransaksi');
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}