import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';
import 'dart:async';

class Splash1 extends StatefulWidget {
  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    // Timer untuk durasi splash screen
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()), // Halaman berikutnya
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
              decoration: BoxDecoration(color: Color(0xFFABC270)),
            ),
            Positioned(
              left: 25,
              top: 250,
              child: Image.asset(
                'assets/FST.png', // Ganti dengan path gambar Anda
                width: 370,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 165,
              top: 460, // Adjust the position as needed
              child: Container(
                  child: Text(
                'FaSTapp',
                style: GoogleFonts.getFont(
                  'Rubik',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              )),
            ),
          ])),
    );
  }
}
