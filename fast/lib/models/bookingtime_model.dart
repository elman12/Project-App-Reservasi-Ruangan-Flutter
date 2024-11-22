class Booking {
  final String nama;
  final String unitRuangan;
  final String organisasi;

  Booking({
    required this.nama,
    required this.unitRuangan,
    required this.organisasi,
  });

  // Konversi JSON ke objek Booking
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      nama: json['nama'] ?? 'Unknown',
      unitRuangan: json['unit_ruangan'] ?? 'Unknown',
      organisasi: json['organisasi'] ?? 'Unknown',
    );
  }
}
