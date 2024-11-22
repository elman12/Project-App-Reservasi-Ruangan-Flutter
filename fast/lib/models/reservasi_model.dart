class Booking {
  final String nama;
  final String unitRuangan;
  final String organisasi;
  final String waktuMulai;
  final String waktuSelesai;

  Booking({
    required this.nama,
    required this.unitRuangan,
    required this.organisasi,
    required this.waktuMulai,
    required this.waktuSelesai,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      nama: json['nama'] ?? 'Unknown',
      unitRuangan: json['unit_ruangan'] ?? 'Unknown',
      organisasi: json['organisasi'] ?? 'Unknown',
      waktuMulai: json['tanggal_peminjaman'] ?? 'Unknown',
      waktuSelesai: json['tanggal_kembali'] ?? 'Unknown',
    );
  }
}
