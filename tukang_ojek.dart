class TukangOjek {
  int? id;
  final String nama;
  final String nopol;
  int jumlahOrder;
  double omzet;

  TukangOjek({
    this.id,
    required this.nama,
    required this.nopol,
    this.jumlahOrder = 0,
    this.omzet = 0.0
  });
}