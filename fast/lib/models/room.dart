class Room {
  final int id;
  final String namaRuangan;
  final String deskripsi;
  final String lokasi;
  final String gambarRuangan;

  Room({
    required this.id,
    required this.namaRuangan,
    required this.deskripsi,
    required this.lokasi,
    required this.gambarRuangan,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] ?? 0, // Pastikan nilai default jika null
      namaRuangan: json['nama_ruangan'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      lokasi: json['lokasi'] ?? '',
      gambarRuangan: json['gambar_ruangan'] ?? '',
    );
  }
}
