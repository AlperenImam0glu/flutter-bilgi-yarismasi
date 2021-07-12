import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  List<Soru> soruBankasi = [
    Soru("Titanic gelmiş geçmiş en büyük gemidir", false),
    Soru("Dünyadaki tavuk sayısı insan sayısından fazladır", true),
    Soru("Kelebeklerin ömrü bir gündür", false),
    Soru("Dünya düzdür", false),
    Soru("Kaju fıstığı aslında bir meyvenin sapıdır", true),
    Soru("Fatih Sultan Mehmet hiç patates yememiştir", true),
  ];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruBankasi[soruIndex].soruMetni,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              runSpacing: 3,
              spacing: 3,
              children: secimler,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 40.0,
                      ),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == false) {
                            secimler.add(KDogruIconu);
                          } else {
                            secimler.add(KYanlisIconu);
                          }

                          soruIndex++;
                          // secimler.add(KYanlisIconu);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 40.0),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == true) {
                            secimler.add(KDogruIconu);
                          } else {
                            secimler.add(KYanlisIconu);
                          }
                          soruIndex++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Soru {
  String soruMetni;
  bool soruYaniti;
  Soru(@required this.soruMetni, this.soruYaniti);
}
