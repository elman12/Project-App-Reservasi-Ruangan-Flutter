import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Reservasi extends StatefulWidget {
  @override
  _ReservasiState createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nimController = TextEditingController();
  TextEditingController _organisasiController = TextEditingController();
  TextEditingController _tanggalPeminjamanController = TextEditingController();
  TextEditingController _tanggalKembaliController = TextEditingController();
  String? _selectedUnit;
  File? _selectedFile;
  bool _isLoading = false;

  final String baseUrl = 'http://10.0.2.2:5000';

  List<String> unitRuangan = [
    "Ruang Rapat 1",
    "Ruang Rapat 2",
    "Ruang Aula",
    "Lab Komputer"
  ];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/reservasi_room'),
      );
      request.fields['nama'] = _namaController.text;
      request.fields['nim'] = _nimController.text;
      request.fields['organisasi'] = _organisasiController.text;
      request.fields['unit_ruangan'] = _selectedUnit ?? '';
      request.fields['tanggal_peminjaman'] = _tanggalPeminjamanController.text;
      request.fields['tanggal_kembali'] = _tanggalKembaliController.text;

      if (_selectedFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'surat_permohonan',
          _selectedFile!.path,
        ));
      }

      setState(() {
        _isLoading = true;
      });

      try {
        final response = await request.send();
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Tampilkan dialog notifikasi sukses
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Reservasi Berhasil"),
                content: Text("Reservasi ruangan Anda telah berhasil dikirim."),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                  ),
                ],
              );
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Gagal mengirim reservasi")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Terjadi kesalahan: $e")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reservasi Ruangan'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _nimController,
                        decoration: InputDecoration(
                          labelText: 'NIM',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'NIM tidak boleh kosong' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _organisasiController,
                        decoration: InputDecoration(
                          labelText: 'Organisasi/Lembaga',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Organisasi tidak boleh kosong' : null,
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedUnit,
                        items: unitRuangan.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedUnit = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Unit Ruangan',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value == null ? 'Pilih unit ruangan' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _tanggalPeminjamanController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Pinjam',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () =>
                            _selectDate(context, _tanggalPeminjamanController),
                        validator: (value) => value!.isEmpty
                            ? 'Tanggal pinjam tidak boleh kosong'
                            : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _tanggalKembaliController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Kembali',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () =>
                            _selectDate(context, _tanggalKembaliController),
                        validator: (value) =>
                            value!.isEmpty ? 'Tanggal kembali tidak boleh kosong' : null,
                      ),
                      SizedBox(height: 16),
                      TextButton.icon(
                        onPressed: _pickFile,
                        icon: Icon(Icons.upload_file),
                        label: Text(_selectedFile == null
                            ? 'Upload Surat Permohonan'
                            : 'File: ${_selectedFile!.path.split('/').last}'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFEC868),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: _submitForm,
                        child: Text(
                    'Kirim',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color:
                          Color.fromARGB(255, 16, 15, 15), // Warna teks tombol
                    ),
                  ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
