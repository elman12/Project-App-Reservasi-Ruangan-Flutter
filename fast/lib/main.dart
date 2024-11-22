import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'ForgetPass.dart';
import 'Splash1.dart';
import 'Splash2.dart';
import 'package:fast/models/services/Api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1(), // Set Splash1 as the initial page
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isObscured = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final nim = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (nim.isEmpty || password.isEmpty) {
      _showMessage('NIM dan password harus diisi!');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await login(nim, password);
      setState(() {
        _isLoading = false;
      });

      if (response['error'] == false) {
        // Simpan NIM ke SharedPreferences setelah login berhasil
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('nim', nim);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Splash2(), // Halaman setelah login
          ),
        );
      } else {
        _showMessage(response['message']);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showMessage('Terjadi kesalahan saat login: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
          ),
          Positioned(
            left: 25,
            top: 65,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login()), // Halaman login
                );
              },
              child: Image.asset(
                'assets/back.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: 118,
            child: Container(
              child: Text(
                'Selamat Datang',
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
            top: 150,
            child: Container(
              child: Text(
                'Masukkan detail akunmu menggunakan',
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
            top: 165,
            child: Container(
              child: Text(
                'akun SALAM ',
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
            left: 40,
            top: 270,
            child: Container(
              child: Text(
                'Nim',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 300,
            child: Container(
              margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
              width: 360,
              height: 50,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 253, 254, 255),
                  hintText: 'Nim',
                  hintStyle: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromARGB(255, 16, 15, 15),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14, horizontal: 20),
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
            ),
          ),
          Positioned(
            left: 40,
            top: 380,
            child: Container(
              child: Text(
                'Password',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 410,
            child: Container(
              margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
              width: 360,
              height: 50,
              child: Stack(
                children: [
                  TextField(
                    controller: _passwordController,
                    obscureText: _isObscured,
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
                      contentPadding: EdgeInsets.fromLTRB(20, 16, 0, 16),
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
                          _isObscured = !_isObscured;
                        });
                      },
                      child: Image.asset(
                        _isObscured
                            ? 'assets/hide.png'
                            : 'assets/view.png',
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
            left: 5,
            top: 510,
            child: Container(
              margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
              width: 360,
              height: 50,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFEC868),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Masuk',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
