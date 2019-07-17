import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SuggestedNames extends StatefulWidget {
  @override
  _SuggestedNamesState createState() => _SuggestedNamesState();
}

class _SuggestedNamesState extends State<SuggestedNames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggested names"),
      ),
//      body: NamesList(),
    );
  }
}
