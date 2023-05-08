import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutThisApp extends StatefulWidget {
  const AboutThisApp({Key? key}) : super(key: key);

  @override
  State<AboutThisApp> createState() => _AboutThisAppState();
}

class _AboutThisAppState extends State<AboutThisApp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ABOUT THIS APP',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/img/initomat.jpg'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Alterra Academy dipercaya sebagai salah satu mitra untuk program Studi Independen Bersertifikat (SIB) Kampus Merdeka oleh Kemendikbud, di mana mahasiswa akan mendapatkan pembelajaran dan practical knowledge dari mentor-mentor professional yang telah berkecimpung di industri IT. Program ini dikembangkan sedemikian rupa agar semua mahasiswa yang mengikuti dapat mendapatkan ilmu-ilmu yang relevan dengan dunia kerja, sehingga bisa segera berkarir setelah menyelesaikan studinya.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/img/initomat1.jpg'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Aplikasi ini diperuntukkan untuk mengklasifikasi dan mengidentifikasi berbagai penyakit pada tanaman tomat berdasarkan visualisasi daun tanaman tomat dan memberikan informasi penyakit tersebut serta memberikan cara mengatasinya. Dengan adanya proyek ini kami harap dapat meningkatkan kualitas dari setiap pertanian tomat yang akan didistribusikan ke pasar - pasar. Proyek ini akan memberikan informasi terkait diagnosa penyakit yang diderita tumbuhan tomat berdasarkan visual daun tomat dan cara mengatasi atau penanggulangannya.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
