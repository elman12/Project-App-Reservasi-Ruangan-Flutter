import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ForgetPass.dart';
import 'home.dart';

class StepPass extends StatefulWidget {
  @override
  _StepPassState createState() => _StepPassState();
}

class _StepPassState extends State<StepPass> {
  bool _isObscured = true;

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
                            ForgetPass()), // Replace with your target page
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
                  'Buat Kata Sandi Baru',
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
                  'Kata sandi baru harus berbeda dengan kata',
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
                  'sandi yang sebelumnya',
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
                  'Password',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),

            // Password Textfield
            Positioned(
              left: 5,
              top: 265,
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: Stack(
                  children: [
                    TextField(
                      obscureText:
                          _isObscured, // Gunakan kondisi untuk menyembunyikan atau menampilkan password
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 253, 254, 255),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromARGB(255, 16, 15, 15),
                        ),
                        // contentPadding: EdgeInsets.symmetric(
                        //   vertical: 14,
                        //   horizontal: 50,
                        // ),
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 0,
                            16), // Mengatur jarak horizontal dan vertikal untuk placeholder
                        alignLabelWithHint:
                            true, // Menjaga placeholder tetap sejajar vertikal
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 200, 200, 200),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 15, 15),
                          ),
                        ),
                      ),
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromARGB(255, 16, 15, 15),
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 13,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured =
                                !_isObscured; // Ubah kondisi untuk menampilkan atau menyembunyikan password
                          });
                        },
                        child: Image.asset(
                          _isObscured
                              ? 'assets/view.png'
                              : 'assets/hide.png', // Ganti ikon sesuai kondisi
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 35,
              top: 320, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Minimal harus 8 karakter',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 35,
              top: 360, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Konfimasi Password',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 390,
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: Stack(
                  children: [
                    TextField(
                      obscureText:
                          _isObscured, // Gunakan kondisi untuk menyembunyikan atau menampilkan password
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 253, 254, 255),
                        hintText: 'Konfirmasi Password',
                        hintStyle: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromARGB(255, 16, 15, 15),
                        ),
                        // contentPadding: EdgeInsets.symmetric(
                        //   vertical: 14,
                        //   horizontal: 50,
                        // ),
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 0,
                            16), // Mengatur jarak horizontal dan vertikal untuk placeholder
                        alignLabelWithHint:
                            true, // Menjaga placeholder tetap sejajar vertikal
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 200, 200, 200),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 15, 15),
                          ),
                        ),
                      ),
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromARGB(255, 16, 15, 15),
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 13,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured =
                                !_isObscured; // Ubah kondisi untuk menampilkan atau menyembunyikan password
                          });
                        },
                        child: Image.asset(
                          _isObscured
                              ? 'assets/view.png'
                              : 'assets/hide.png', // Ganti ikon sesuai kondisi
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 445, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Kedua kata sandi harus cocok',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 480, // Atur posisi sesuai kebutuhan
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
                width: 360,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
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
                    'Masuk',
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
