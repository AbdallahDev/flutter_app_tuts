import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Flutter App",
      home: WordPairs(),
    );
  }
}

class WordPairs extends StatefulWidget {
  @override
  _WordPairsState createState() => _WordPairsState();
}

class _WordPairsState extends State<WordPairs> {
  final _words = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//
//    final firstWord = wordPair.first;
//    final secondWord = wordPair.second;
//    final completeWord =
//        firstWord.toUpperCase() + " " + secondWord.toUpperCase();

    return Scaffold(
        appBar: AppBar(
          title: Text("List Items"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: /*1*/ (context, i) {
              if (i.isOdd) return Divider();
              /*2*/

              final index = i ~/ 2; /*3*/
              print(index);
              if (index >= _words.length) {
                _words.addAll(generateWordPairs().take(10)); /*4*/
              }
              return Text(_words[index].toString());
            }));
  }
}
