import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/RandomWords.dart';

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont=const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {

    var wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("startup Name genetator "),
     ),
     body: _buildSuggestions(),
   );

  }

  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if(i.isOdd)return new Divider();

          final index=i~/2;
          if(index>=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair  pair){

    return new ListTile(
      title: new Text(pair.asPascalCase,  style:_biggerFont),
    );
  }

}