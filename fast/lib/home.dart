import 'dart:io';

import 'package:fast/models/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fast/models/reservasi_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'kalender.dart';
import 'reservasi.dart';
import 'ruangan.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Daftar halaman untuk setiap ikon di BottomNavigationBar
  final List<Widget> _pages = [
    HomePage(),
    HistoryScreen(),
    ProfilePage(),
  ];

  // Update halaman saat ikon ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[
            _selectedIndex], // Tampilkan halaman berdasarkan ikon yang dipilih
        bottomNavigationBar: Container(
          height: 100, // Atur tinggi BottomNavigationBar sesuai kebutuhan
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            iconSize: 30, // Atur ukuran ikon sesuai kebutuhan
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.black, // Warna ikon saat dipilih
            unselectedItemColor: Colors.black, // Warna ikon saat tidak dipilih
          ),
        ),
      ),
    );
  }
}

// Buat halaman untuk setiap ikon navigasi bawah
class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM yyyy').format(now);
    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          bottom: screenHeight / 1.36,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFABC270),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: screenHeight / 1,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 253, 254),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          left: 3,
          top: 70,
          child: Container(
            margin: EdgeInsets.fromLTRB(18, 0, 15.8, 2),
            width: 370,
            height: 45,
            child: Stack(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 253, 254, 255),
                    hintText: 'Cari',
                    hintStyle: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 16, 15, 15),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
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
                  left: 330,
                  top: 10,
                  child: Image.asset(
                    'assets/search.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Kotak pertama
        Positioned(
          left: 40,
          top: 160,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ruangan()),
              );
            },
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Color(0xFFFEC868),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(1, 4),
                    blurRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 51,
          top: 170,
          child: Image.asset(
            'assets/door.png',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 45,
          top: 230,
          child: Container(
            child: Text(
              'Ruangan',
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),

        // Kotak kedua
        Positioned(
          left: 170,
          top: 160,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kalender()),
              );
            },
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Color(0xFFFEC868),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(1, 4),
                    blurRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 185,
          top: 175,
          child: Image.asset(
            'assets/calendar.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 175,
          top: 230,
          child: Container(
            child: Text(
              'Kalender',
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),

        // Kotak ketiga
        Positioned(
          left: 300,
          top: 160,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reservasi()),
              );
            },
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Color(0xFFFEC868),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(1, 4),
                    blurRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 315,
          top: 175,
          child: Image.asset(
            'assets/reservation.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 305,
          top: 230,
          child: Container(
            child: Text(
              'Reservasi',
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
          left: 30,
          top: 350,
          child: Container(
            child: Text(
              'Jadwal Hari ini - $formattedDate', // Menggunakan tanggal otomatis
              style: GoogleFonts.getFont(
                'Rubik',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),




        Align(
  alignment: Alignment.topCenter,
  child: Padding(
    padding: EdgeInsets.only(top: 400), // Adjust the top padding
    child: FutureBuilder<List<Booking>>(
      future: fetchBookingsForToday(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Tidak ada yang reservasi untuk hari ini.');
        } else {
          final bookings = snapshot.data!;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Tambahkan padding di luar ListView
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
)








        

       

        
        // // Line
        // Positioned(
        //   left: 25,
        //   top: 300,
        //   child: Container(
        //     width: 350,
        //     height: 1.5,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}



class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<dynamic> history = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final nim = prefs.getString('nim');

      if (nim != null) {
        final result = await fetchHistory(nim);
        setState(() {
          history = result;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('NIM tidak ditemukan.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histori Reservasi')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : history.isEmpty
              ? Center(child: Text('Tidak ada histori.'))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          // Box hijau
                          Container(
                            width: 63,
                            height: 63,
                            decoration: BoxDecoration(
                              color: Color(0x80FEC868),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                item['unit_ruangan'],
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          // Detail informasi
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['nama'] ?? 'Nama tidak tersedia',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  item['organisasi'] ?? 'Organisasi tidak tersedia',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                    'Mulai: ${DateFormat('dd MMM yyyy HH:mm').format(DateTime.parse(item['tanggal_peminjaman']))}',
                                     style: GoogleFonts.inter(
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
}




      

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nim = 'Memuat...';
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final storedNim = prefs.getString('nim') ?? 'NIM tidak ditemukan';
    final storedImagePath = prefs.getString('profile_image');

    setState(() {
      nim = storedNim;
      profileImagePath = storedImagePath;
    });
  }

  Future<void> updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedFile.path);

      setState(() {
        profileImagePath = pickedFile.path;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada gambar yang dipilih.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            left: 150,
            top: 140,
            child: GestureDetector(
              onTap: updateProfileImage, // Menambahkan fungsi untuk memperbarui foto
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.2,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: profileImagePath != null
                    ? Image.file(
                        File(profileImagePath!),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/default_profile.png', // Gambar default jika belum ada gambar
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          
          Positioned(
            left: 175,
            top: 310,
            child: Container(
              child: Text(
                nim,
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}