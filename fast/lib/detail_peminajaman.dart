import 'package:fast/models/reservasi_model.dart';
import 'package:fast/models/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kalender.dart';
import 'package:intl/intl.dart';

class Dpem extends StatefulWidget {
  @override
  _DpemState createState() => _DpemState();
}

class _DpemState extends State<Dpem> {
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
                  // Navigates to a new page when the image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kalender()), // Ganti dengan halaman tujuan
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
              left: 70,
              top: 65, // Adjust the position as needed
              child: Container(
                child: Text(
                  'Detail Jadwal Peminjaman',
                  style: GoogleFonts.getFont(
                    'Rubik',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 90), // Adjust the top padding
                child: FutureBuilder<List<Booking>>(
                  future: getAllBookings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('Tidak ada booking untuk hari ini.');
                    } else {
                      final bookings = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20), // Padding di luar ListView
                        child: ListView.builder(
                          // Menghapus shrinkWrap dan menggunakan physics yang memungkinkan scroll
                          itemCount: bookings.length,
                          itemBuilder: (context, index) {
                            final booking = bookings[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5), // Margin antar card
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Kotak Hijau
                                  Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(
                                      color: Color(0x80FEC868),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        booking.unitRuangan,
                                        style: GoogleFonts.getFont(
                                          'Rubik',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  // Informasi Nama dan Organisasi
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          booking.nama,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          booking.organisasi,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          'Mulai: ${DateFormat('dd MMM yyyy HH:mm').format(DateTime.parse(booking.waktuMulai))}',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
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
