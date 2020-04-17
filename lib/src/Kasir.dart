import 'package:flutter/material.dart';
import 'Bayar.dart';

class Kasir extends StatefulWidget {
  @override
  State createState() => KasirState();
}

class KasirState extends State<Kasir> {
  int jmlBeli = 0, hasil = 0;
  double harga = 0;
  String namaBarang;

  void hitung() {
    setState(() {
      hasil = jmlBeli * harga.toInt();
    });

    //untuk berpindah halaman dengan membawa parameter
    var route = new MaterialPageRoute(
      builder: (BuildContext) => Bayar(
          namaBarang: namaBarang, harga: harga, jmlBeli: jmlBeli, totalBelanja: hasil),
    );
    Navigator.of(context).push(route);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Center(child: Text("Transaksi"))),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          namaBarang = txt;
                        });
                      },
                      keyboardType: TextInputType.text,
                      maxLength: 100,
                      textCapitalization: TextCapitalization.words,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          labelText: "Nama Barang",
                          //suffix: Text('qty'),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          //filled: true,
                          hintText: 'Nama Barang'),
                    ),
                  ),
                  Container(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          jmlBeli = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          labelText: "Jumlah Beli",
                          suffix: Text('Qty'),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          //filled: true,
                          hintText: 'Jumlah Beli'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          harga = double.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 15,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          labelText: "Harga Barang",
                          suffix: Text('Rp. '),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          //filled: true,
                          hintText: 'Harga Barang'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                          color: Colors.lightBlueAccent,
                          child: Text(
                            "Bayar",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: hitung),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "Total belanja : Rp. $hasil",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
