import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/palsumodel.dart'; //memanggil model
import 'package:http/http.dart' as httpw;
import '../widget/kartu.dart';

class Rumah extends StatefulWidget {
  const Rumah({Key? key}) : super(key: key);

  @override
  State<Rumah> createState() => _RumahState();
}

class _RumahState extends State<Rumah> {
  late PalsuModel dataPalsu;

  Future ambilnanti() async {
    try {
      var responsenanti =
          await httpw.get(Uri.parse("https://covid19.mathdro.id/api"));

      print(responsenanti.body);
      print("======");

      Map<String, dynamic> palsudata =
          json.decode(responsenanti.body) as Map<String, dynamic>;

      //print(palsu);

      dataPalsu = PalsuModel.fromJson(palsudata);

      // print(dataPalsu.deaths.value);
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Final API"),
      ),
      body: FutureBuilder(
          future: ambilnanti(),
          builder: (context, snapshot) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                kartu(
                  teks: "Data Kematian Covid",
                  angka: "${dataPalsu.deaths.value}",
                ),
                kartu(
                  teks: "Data Konfirmasi Covid",
                  angka: "${dataPalsu.confirmed.value}",
                )
              ],
            );
          }),
    );
  }
}
