//package yg dibutuhkan oleh aplikasi
import 'package:english_words/english_words.dart';
//paket bahasa inggris
import 'package:flutter/material.dart';
//paket untuk tampilan UI (material UI)
import 'package:provider/provider.dart';
// paket untuk interaksi  UI
void main() {
  runApp(MyApp());
}
//membuat aplikasi dari statelessWidget (template aplikasi), aplikasinya bernama myApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});//bahwa aplikasi ini akan ttp, tidak berubah setelah di build

  @override//mengganti nilai lama yg sudah ada di template dg nilai-nilai yg baru (replace / overwrite)
  //fungsi build adalah fungsi yg membengun UI (mengatur posisi widget, dst)
  Widget build(BuildContext context) {
    //changeNotifierProvider mendengarkan / mendeteksi semua interaksi yg  terejadi di application
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
          //nenbuat satu state bernama MyAppState 
      child: MaterialApp(
        //pada state ini, menggunakan, menggunakan style desain MaterialUI
        title: 'Namer App',//diberi judul namerApp
        theme: ThemeData(// data tema aplikasi, diberi warna deepOrange 
          useMaterial3: true,//versi materialUI yg dipakai versi 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),// nama halaman "MyHomePage" yg menggunakan state "MyHomePage".
      ),
    );
  }
}
//mendefinisikan MyAppState
class MyAppState extends ChangeNotifier {
  //state MyAppState diisi dg 2 kata random yg digabung , kata random tab disimpan di variable wordpair
  var current = WordPair.random();//variabel pair  menyimpan kata yg sedang tampil/aktif
  

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;


    return Scaffold(//base (canvas) dari lsyout 
      body: Column(//di atas scaffold, ada body ,body nya diberi kolom
      mainAxisAlignment: MainAxisAlignment.center,
        children: [//di dalam kolom, diberi teks
          BigCard(),
          bigCard(pair: pair),


//membuat button timbul di dalam body
                    ElevatedButton(
            onPressed: () {//fungsi yg dieksekusi butten ketika ditekan
            appState.getNext(); 
              print('button pressed!');//tampilkan teks button pressed ketika di tekan
            },
            child: Text('Next'),// berikan teks 'next' pada button (sebagai child)
          ),
        ],
      ),
    );
  }
}

class bigCard extends StatelessWidget {
  const bigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
        final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),//padding di sekitar tab
        
        child: Text(pair.asLowerCase, style: style, semanticsLabel: "${pair.first} ${pair.second}"),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Text('A random idea:');
  }
}