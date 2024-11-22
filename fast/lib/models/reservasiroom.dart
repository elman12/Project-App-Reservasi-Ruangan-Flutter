class ReservasiRoom {
  final String nama;
  final String nim;
  final String organisasi;
  final String unitRuangan;
  final String tanggalPeminjaman;
  final String tanggalKembali;
  final String suratPermohonan;

  ReservasiRoom({
    required this.nama,
    required this.nim,
    required this.organisasi,
    required this.unitRuangan,
    required this.tanggalPeminjaman,
    required this.tanggalKembali,
    required this.suratPermohonan,
  });

  factory ReservasiRoom.fromJson(Map<String, dynamic> json) {
    return ReservasiRoom(
      nama: json['nama'],
      nim: json['nim'],
      organisasi: json['organisasi'],
      unitRuangan: json['unit_ruangan'],
      tanggalPeminjaman: json['tanggal_peminjaman'],
      tanggalKembali: json['tanggal_kembali'],
      suratPermohonan: json['surat_permohonan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'organisasi': organisasi,
      'unit_ruangan': unitRuangan,
      'tanggal_peminjaman': tanggalPeminjaman,
      'tanggal_kembali': tanggalKembali,
      'surat_permohonan': suratPermohonan,
    };
  }
}
