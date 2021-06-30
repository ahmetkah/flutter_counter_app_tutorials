import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/box_manager.dart';
import '../utils/hive_manager.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  /// HiveManager'a erişmek için değişken.
  late HiveManager _hiveManager;

  @override
  void initState() {
    super.initState();

    /// HiveManager'dan nesne oluşturarak değişkene atadık.
    _hiveManager = HiveManager();
  }

  @override
  void dispose() {
    /// İşi bitince kapat
    _hiveManager.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hive DB | Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sayaç Değeri:',
              style: Theme.of(context).textTheme.headline3,
            ),

            ///Kutuyu [DİNLE]
            ValueListenableBuilder<Box<int>>(
              /// [A] [valueListenable] parametresine
              /// Açtığımız/Çağırdığımız kutuyu dinlemesini istedik.
              valueListenable: _hiveManager.boxCounter.listenable(),
              builder: (context, box, widget) {
                /// Read Box - Kutudan [OKU/GETİR]
                /// [B] Dinlediğimiz kutudaki değişkenin değerine eriştik.
                /// [defaultValue] Varsayılan değeri 0 atadık.
                /// Yani başlarken kutuda değer olmayacağı için 0 gelsin.
                var readCounter = box.get(BoxManager.instance.keyNameCounter, defaultValue: 0);

                /// 2. alternatif: Nesne üzerinden dinlenen değişkene erişme
                /// var readCounter = _hiveManager.counter;
                return Text(
                  /// [C] Ekrana yazdıralım
                  '$readCounter',
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
          ],
        ),
      ),

      /// [4] FAB Düğmelerini Oluşturma
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// Arttır FAB Düğmesi
            child: FloatingActionButton(
              heroTag: 'incrementTag',

              /// [4-A]: Arttırma metodunu çalıştır
              onPressed: _hiveManager.incrementCounter,
              tooltip: 'Arttır',
              child: Icon(
                Icons.add,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// Sıfırla FAB Düğmesi
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              heroTag: 'resetTag',

              /// [4-B]: Sıfırlama metodunu çalıştır

              onPressed: _hiveManager.resetCounter,
              tooltip: 'Sıfırla',
              child: Icon(
                Icons.exposure_zero_sharp,
                color: Colors.blue,
              ),
            ),
          ),

          /// Azalt FAB Düğmesi
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: FloatingActionButton(
              heroTag: 'decrementTag',

              /// [4-C]: Azaltma metodunu çalıştır

              onPressed: _hiveManager.decrementCounter,
              tooltip: 'Azalt',
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
