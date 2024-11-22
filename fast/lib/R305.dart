import 'package:fast/Ruangan.dart';
import 'package:fast/models/room.dart'; // Mengimpor model Room
import 'package:fast/models/services/Api.dart';
import 'package:fast/reservasi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class R305 extends StatefulWidget {
  final int roomId; // Menerima ID ruangan dari halaman sebelumnya

  R305({required this.roomId}); // Konstruktor dengan parameter roomId

  @override
  _R305State createState() => _R305State();
}

class _R305State extends State<R305> {
  late Future<Room> roomData; // Menggunakan model Room

  @override
  void initState() {
    super.initState();
    // Ambil data ruangan sesuai dengan ID yang diterima
    roomData = getRoomById(widget.roomId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<Room>(
          future: roomData, // Future untuk menampilkan data ruangan
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No room data found'));
            } else {
              final room = snapshot.data!;

              return Stack(
                children: [
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
                          MaterialPageRoute(builder: (context) => Ruangan()),
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
                    left: 70,
                    top: 65,
                    child: Text(
                      'Detail Ruangan',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 140,
                    child: Container(
                      width: 370,
                      height: 206,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'http://10.0.2.2:5000/${room.gambarRuangan}', // Menggunakan gambar dari model Room
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text('Failed to load image'));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 390,
                    child: Text(
                      'Deskripsi',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 420,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text(
                        room.deskripsi, // Menampilkan deskripsi dari model Room
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),

                  // Lokasi Ruangan
                  Positioned(
                    left: 20,
                    top: 555, // Atur posisi sesuai kebutuhan
                    child: Text(
                      'Lokasi Ruangan',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 585, // Atur posisi sesuai kebutuhan
                    child: Text(
                      room.lokasi, // Menampilkan lokasi dari model Room
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),



                   Positioned(
                left: 20,
                top: 640, // Adjust the position as needed
                child: Container(
                  child: Text(
                    'Fasilitas Ruangan',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),

              // kotak pertama
              Positioned(
                left: 20,
                top: 675,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Ruangan()),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEC868),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(1, 4),
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 680,
                child: Image.asset(
                  'assets/solar_tv-broken.png', // Ganti dengan path gambar Anda
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),

              //kotak kedua
              Positioned(
                left: 95,
                top: 675,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Ruangan()),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEC868),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(1, 4),
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 683,
                child: Image.asset(
                  'assets/icon-park-outline_sound-one.png', // Ganti dengan path gambar Anda
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),

              //kotak ketiga
              Positioned(
                left: 180,
                top: 675,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Ruangan()),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEC868),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(1, 4),
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 188,
                top: 685,
                child: Image.asset(
                  'assets/hugeicons_smart-ac.png', // Ganti dengan path gambar Anda
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),

              //kotak keempat
              Positioned(
                left: 260,
                top: 675,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Ruangan()),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEC868),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(1, 4),
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 269,
                top: 683,
                child: Image.asset(
                  'assets/material-symbols_wifi.png', // Ganti dengan path gambar Anda
                  width: 33,
                  height: 33,
                  fit: BoxFit.contain,
                ),
              ),

              //kotak kelima
              Positioned(
                left: 340,
                top: 675,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ruangan()),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEC868),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(1, 4),
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 348,
                top: 683,
                child: Image.asset(
                  'assets/solar_chair-broken.png', // Ganti dengan path gambar Anda
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),


                Positioned(
  left: 1,
  top: 750, // Atur posisi sesuai kebutuhan
  child: Container(
    margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
    width: 380,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Reservasi(), // Ganti dengan halaman Anda
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFEC868), // Warna tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(
        'Reservasi',
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont(
          'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Color.fromARGB(255, 16, 15, 15),
        ),
      ),
    ),
  ),
),




                  
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
