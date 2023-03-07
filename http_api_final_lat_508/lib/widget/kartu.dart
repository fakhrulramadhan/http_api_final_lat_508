import 'package:flutter/material.dart';

import '../main.dart';

class kartu extends StatelessWidget {
  // const kartu({
  //   Key? key,
  // }) : super(key: key);

  //buat variabel teks dan angka beserta tipe dataya untuk menampilkan data dinamis
  String teks;
  String angka;

  //buat konstruktornya dulu
  kartu({required this.teks, required this.angka});

  @override
  Widget build(BuildContext context) {
    return Card(
      //posisinya sudah agak rata tengah dengan margin
      margin: EdgeInsets.all(26),
      elevation: 10,
      //agar di setiap pojoknya tidak terlihat warna putih,
      //kasih shape roundeborder
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.teks,
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                this.angka,
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
