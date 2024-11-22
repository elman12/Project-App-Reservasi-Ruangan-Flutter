import 'package:fast/models/reservasi_model.dart';
import 'package:fast/models/room.dart';
import 'package:fast/models/room_id_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fast/models/user_model.dart';  // Import model User

// URL dasar API
const String baseUrl = 'http://10.0.2.2:5000';  // Ganti dengan URL backend yang benar

// Menggunakan fetchRooms untuk mengambil data
Future<List<Room>> fetchRooms() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/rooms'));

    if (response.statusCode == 200) {
      // Mendekode response body yang dihasilkan
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Mengambil data yang ada di dalam 'data' dan mengonversinya menjadi list
      final roomsJson = jsonResponse['data'] as List;
      return roomsJson.map((roomJson) => Room.fromJson(roomJson)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  } catch (e) {
    throw Exception('Error while fetching rooms: $e');
  }
}

// Fungsi untuk membuat reservasi
Future<bool> createReservation(Map<String, dynamic> reservationData) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/reservasi_room'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(reservationData), // Encode data dalam format JSON
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Reservation created successfully: ${response.body}");
      return true;
    } else {
      print("Failed to create reservation: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Error while creating reservation: $e");
    return false;
  }
}



// Fungsi Login
Future<Map<String, dynamic>> login(String nim, String password) async {
  try {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nim': nim, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData; // Mengembalikan data login
    } else {
      final responseData = json.decode(response.body);
      return {'success': false, 'message': responseData['message']};
    }
  } catch (error) {
    return {'success': false, 'message': 'Terjadi kesalahan saat login.'};
  }
}

// Fungsi Fetch Histori
Future<List<dynamic>> fetchHistory(String nim) async {
  final url = Uri.parse('$baseUrl/api/history/$nim');
  print('Fetching history dari URL: $url'); // Debugging

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('Response API: $responseData'); // Debugging

      if (responseData['success']) {
        return responseData['history'];
      } else {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception('Gagal mengambil data history. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Terjadi kesalahan: $error'); // Debugging
    throw Exception('Terjadi kesalahan: $error');
  }
}




// Fungsi untuk mendapatkan data reservasi sesuai tanggal hari ini
Future<List<Booking>> fetchBookingsForToday() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/reservasi-room/today'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('data') && jsonResponse['data'] != null) {
        final roomsJson = jsonResponse['data'] as List;
        return roomsJson.map((roomJson) => Booking.fromJson(roomJson)).toList();
      } else {
        throw Exception('No booking data available');
      }
    } else {
      throw Exception('Failed to load bookings');
    }
  } catch (e) {
    throw Exception('Error while fetching bookings: $e');
  }
}




Future<List<Booking>> getAllBookings() async {
   try {
    final response = await http.get(Uri.parse('$baseUrl/reservasi-room'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('data') && jsonResponse['data'] != null) {
        final roomsJson = jsonResponse['data'] as List;
        return roomsJson.map((roomJson) => Booking.fromJson(roomJson)).toList();
      } else {
        throw Exception('No booking data available');
      }
    } else {
      throw Exception('Failed to load bookings');
    }
  } catch (e) {
    throw Exception('Error while fetching bookings: $e');
  }
}


Future<Room> getRoomById(int roomId) async {
  final response = await http.get(Uri.parse('$baseUrl/room/$roomId'));

  if (response.statusCode == 200) {
    // Parsing JSON ke model Room
    return Room.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load room data');
  }
}





  

  

















