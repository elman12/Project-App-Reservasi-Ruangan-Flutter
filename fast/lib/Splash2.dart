import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'home.dart';

class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    // Timer untuk durasi splash screen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Halaman berikutnya
      );
    });
  }

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
              top: 340,
              child: Image.asset(
                'assets/page 2.png', // Ganti dengan path gambar Anda
                width: 370,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 125,
              top: 270, // Adjust the position as needed
              child: Container(
                  child: Text(
                'Berhasil Masuk!',
                style: GoogleFonts.getFont(
                  'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              )),
            ),
          ])),
    );
  }
}
