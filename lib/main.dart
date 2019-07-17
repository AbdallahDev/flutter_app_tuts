import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Suggsted names",
      home: SuggestedNames(),
    );
  }
}

class SuggestedNames extends StatefulWidget {
  @override
  _SuggestedNamesState createState() => _SuggestedNamesState();
}

class _SuggestedNamesState extends State<SuggestedNames> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggested Names"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestedList(),
    );
  }

  Widget _buildSuggestedList() {
    return ListView.builder(
      itemBuilder: (_, i) {
        if (i.isOdd) return Divider(color: Colors.white);

        final int index = i ~/ 2;
        if (index >= _suggestions.length)
          _suggestions.addAll(generateWordPairs().take(10));

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair suggestion) {
    final bool alreadySaved = _saved.contains(suggestion);

    return ListTile(
      title: Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        _modifySavedList(suggestion, alreadySaved);
      },
    );
  }

  void _modifySavedList(WordPair suggestion, bool alreadySaved) {
    setState(() {
      alreadySaved ? _saved.remove(suggestion) : _saved.add(suggestion);
    });
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          final Iterable<ListTile> tiles = _saved.map((wordPair) {
            return ListTile(
              title: Text(
                wordPair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });

          final List<Widget> dividedTiles =
              ListTile.divideTiles(tiles: tiles, context: context).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Saved Names"),
            ),
            body: ListView(
              children: dividedTiles,
            ),
          );
        },
      ),
    );
  }
}
