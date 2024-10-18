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
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();


    return Scaffold(//base (canvas) dari lsyout 
      body: Column(//di atas scaffold, ada body ,body nya diberi kolom
        children: [//di dalam kolom, diberi teks
          Text('A random idea:'),
          Text(appState.current.asLowerCase),


//membuat button timbul di dalam body
                    ElevatedButton(
            onPressed: () {//fungsi yg dieksekusi butten ketika ditekan
              print('button pressed!');//tampilkan teks button pressed ketika di tekan
            },
            child: Text('Next'),// berikan teks 'next' pada button (sebagai child)
          ),
        ],
      ),
    );
  }
}