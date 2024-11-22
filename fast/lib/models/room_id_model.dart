class RoomIdModel {
  final int id;
  final String name;
  final String description;
  final String location;
  final String imageUrl;

  RoomIdModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.imageUrl,
  });

  // Factory method to create a RoomIdModel from JSON
  factory RoomIdModel.fromJson(Map<String, dynamic> json) {
    return RoomIdModel(
      id: json['id'],
      name: json['nama_ruangan'],
      description: json['deskripsi'],
      location: json['lokasi'],
      imageUrl: json['gambar_ruangan'],  // Assuming image URL is part of the response
    );
  }
}
