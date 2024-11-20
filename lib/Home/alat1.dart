import 'package:flutter/material.dart';

class Alat1Page extends StatelessWidget {
  const Alat1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text('Alat'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar alat
              Image.asset(
                'assets/benchpress.jpg', // Ganti dengan path gambar Anda
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              // Nama alat
              const Text(
                'Bench Press',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Deskripsi penggunaan alat
              const Text(
                'Kegunaan Bench Press\n\n'
                '1. Menguatkan Otot Dada (Pectoralis Major). Bench press merupakan latihan utama yang menargetkan otot dada, sehingga sangat efektif untuk mengembangkan kekuatan dan massa otot dada.\n\n'
                '2. Mengkaktifkan Otot Bahu dan Trisep. Selain dada, bench press juga melibatkan otot deltoid anterior (bagian depan bahu) dan trisep. Latihan ini membantu memperkuat tubuh dan stabilitas tubuh bagian atas.\n\n'
                '3. Meningkatkan Kekuatan Fungsional. Latihan bench press meningkatkan kekuatan yang bermanfaat dalam aktivitas sehari-hari, seperti mendorong beban berat atau melakukan gerakan mendorong tubuh berat seperti berdiri.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Tombol untuk kembali
              Center(
                child: SizedBox(
                  width: double.infinity, // Membuat tombol selebar layar
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF92A3FD), // Warna tombol
                      padding: const EdgeInsets.symmetric(vertical: 16), // Tinggi tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Membuat sudut tombol melengkung
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}