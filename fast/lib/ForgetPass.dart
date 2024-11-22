import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'StepPass.dart';
import 'main.dart';

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            ),
            Positioned(
              left: 25,
              top: 65,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()), // Replace with your target page
                  );
                },
                child: Image.asset(
                  'assets/back.png', // Ganti dengan path gambar Anda
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 118, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Atur Ulang Kata Sandi',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 150, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Masukkan Email Anda dan kami akan mengirim',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 165, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Intruksi reset kata sandi ',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 235, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Email',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 265, // Atur posisi sesuai kebutuhan
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFE9E9E9),
                    // Warna latar belakang box
                    hintText: 'Email',
                    hintStyle: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(
                          255, 16, 15, 15), // Warna teks placeholder
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20), // Padding dalam box
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Bentuk box menjadi melengkung
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 200, 200,
                            200), // Warna border ketika tidak fokus
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 16, 15, 15), // Warna border ketika fokus
                      ),
                    ),
                  ),
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color.fromARGB(255, 16, 15, 15), // Warna teks input
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 340, // Atur posisi sesuai kebutuhan
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StepPass()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFFEC868), // Warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Bentuk tombol menjadi lingkaran
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 14), // Sesuaikan ukuran vertikal tombol
                  ),
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
              ),
            ),
          ])),
    );
  }
}
