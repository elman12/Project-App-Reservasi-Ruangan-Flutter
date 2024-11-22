import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String nim, String password) async {
  final url = Uri.parse('http://10.0.2.2:5000/login'); // Ganti dengan URL server Anda
  final headers = {"Content-Type": "application/json"};
  
  // Membuat body request
  final body = json.encode({
    'nim': nim,
    'password': password,
  });

  // Kirim request POST
  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Login berhasil
      final responseData = json.decode(response.body);
      print('Login berhasil: ${responseData['message']}');
      return responseData; // Mengembalikan data response
    } else {
      // Login gagal
      final responseData = json.decode(response.body);
      print('Login gagal: ${responseData['message']}');
      return responseData; // Mengembalikan data error response
    }
  } catch (error) {
    print('Terjadi kesalahan: $error');
    
    // Menangani error dengan jenis yang lebih spesifik
    if (error is http.ClientException) {
      return {'error': true, 'message': 'Kesalahan pada jaringan. Periksa koneksi internet Anda.'};
    } else if (error is FormatException) {
      return {'error': true, 'message': 'Format data tidak valid. Periksa server Anda.'};
    } else {
      // Menangani error umum atau error yang tidak terduga
      return {'error': true, 'message': 'Terjadi kesalahan saat login: ${error.toString()}'};
    }
  }
}
