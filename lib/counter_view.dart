import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  final count = useState<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Hooks Counter App',
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
            Text(
              /// [3]: Sayacın değerini ekrana yaz
              '${count.value}',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),

      /// [4] Metotları Tetikleyecek/Çalıştıracak FAB Düğmelerini Oluştur
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// [4-A]: Arttır FAB Düğmesi
            child: FloatingActionButton(
              heroTag: 'incrementTag',

              /// Arttırma metodunu çalıştır
              onPressed: _incrementCounter,

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

            /// [4-B]: Sıfırla FAB Düğmesi
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              heroTag: 'resetTag',

              /// Sıfırlama metodunu çalıştır
              onPressed: _resetCounter,

              tooltip: 'Sıfırla',
              child: Icon(
                Icons.exposure_zero_sharp,
                color: Colors.blue,
              ),
            ),
          ),

          /// [4-C]:Azalt FAB Düğmesi
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: FloatingActionButton(
              heroTag: 'decrementTag',

              /// Azaltma metodunu  çalıştır
              onPressed: _decrementCounter,

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

  void _incrementCounter() {
    /// Value (Sayaç) değerini bir [ARTTIR]
    count.value++;
    debugPrint('Arttırma metodu');
  }

  void _resetCounter() {
    /// Value zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (count.value == 0) return;

    /// Value değerine [0] ata
    count.value = 0;
    debugPrint('Sıfırla metodu');
  }

  void _decrementCounter() {
    /// Value değerini bir [AZALT]
    count.value--;
    debugPrint('Azaltma metodu');
  }
}
