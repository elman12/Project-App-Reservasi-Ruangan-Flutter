import 'package:fast/models/room.dart';
import 'package:fast/models/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'R305.dart';
import 'dart:convert';

class Ruangan extends StatefulWidget {
  @override
  _RuanganState createState() => _RuanganState();
}

class _RuanganState extends State<Ruangan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
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
                    MaterialPageRoute(builder: (context) => Home()),
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
              child: Container(
                child: Text(
                  'Ruangan',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            // FutureBuilder untuk memanggil API dan menampilkan data
            Positioned(
              left: 25,
              top: 120,
              child: Container(
                width: MediaQuery.of(context).size.width - 50, // Set width to be constrained
                height: MediaQuery.of(context).size.height,    // Set height to fill the screen
                child: FutureBuilder<List<Room>>(
                  future: fetchRooms(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No rooms available.'));
                    }

                    final rooms = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: rooms.length,
                      itemBuilder: (context, index) {
                        final room = rooms[index];
                        return Container(
                          width: 360,
                          height: 125,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.2,
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 15,
                                top: 12,
                                child: Container(
                                  width: 115,
                                  height: 100,
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
                                    'http://10.0.2.2:5000/${room.gambarRuangan}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 170,
                                top: 18,
                                child: Text(
                                  room.namaRuangan,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 170,
                                top: 38,
                                child: Text(
                                  room.lokasi,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 170,
                                top: 53,
                                child: Text(
                                  room.deskripsi,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 310,
                                top: 90,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => R305(roomId: room.id)),
                                    );
                                  },
                                  child: Container(
                                    child: Text(
                                      'Lihat',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xFF808080),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
