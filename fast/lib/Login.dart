import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              left: 40,
              top: 130, // Adjust the position as needed
              child: Container(
                  child: Text(
                'Facilities at Sains Technology App',
                style: GoogleFonts.getFont(
                  'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF000000),
                ),
              )),
            ),
            Positioned(
              left: 65,
              top: 190,
              child: Image.asset(
                'assets/page 1.png', // Ganti dengan path gambar Anda
                width: 265,
                height: 265,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 40,
              top: 490, // Adjust the position as needed
              child: Container(
                  child: Text(
                'Booking Tempat Acara Kapan Saja, Di Mana Saja',
                style: GoogleFonts.getFont(
                  'Rubik',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF000000),
                ),
              )),
            ),
            Positioned(
              left: 5,
              top: 530, // Atur posisi sesuai kebutuhan
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFFEC868), // Warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Bentuk tombol menjadi lingkaran
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 14), // Sesuaikan ukuran vertikal tombol
                  ),
                  child: Text(
                    'Lanjutkan',
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
