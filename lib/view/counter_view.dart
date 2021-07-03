import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../service/firestore_service.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  /// FirestoreService'e erişmek için değişken.
  late FirestoreService _firestoreService;
  int counter = 0;

  @override
  void initState() {
    super.initState();

    /// FirestoreService'den nesne oluşturarak değişkene atadık.
    _firestoreService = FirestoreService.instance;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.collectionValueStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _counter = snapshot.data?.docs.first.get('value') as int;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'CloudFirestore | Counter App',
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
                    /// Realtime changes
                    /// [C] Ekrana yazdıralım
                    '$_counter',
                    style: Theme.of(context).textTheme.headline3,
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
                    onPressed: () async {
                      await _firestoreService.updateValue(
                        value: (counter++) + 1,
                      );
                    },
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

                    onPressed: () async {
                      await _firestoreService.updateValue(
                        value: counter = 0,
                      );
                    },
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

                    onPressed: () async {
                      await _firestoreService.updateValue(
                        value: (counter--) - 1,
                      );
                    },
                    tooltip: 'Azalt',
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
