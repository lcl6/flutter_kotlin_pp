import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/RandomWords.dart';
import 'package:flutter_kotlin_pp/state/Counter.dart';

import 'DetailRoute.dart';

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont=const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {

   return new Scaffold(
     appBar: new AppBar(
       title: new Text("startup Name genetator "),
     ),
     body: _buildSuggestions(),
     floatingActionButton: FloatingActionButton(
       onPressed:(){
         //命名路由
         Navigator.pushNamed(context, Counter.CounterName,arguments:true);
         //非命名路由
//         Navigator.push(context,MaterialPageRoute(builder: (context){
//           return new DetailRoute();
//         }));
       },
       tooltip: 'Increment',
       child: Icon(Icons.add),
     ),
   );

  }

  Widget _buildSuggestions(){

    return new Scaffold(
                  body: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView.builder(
                      itemBuilder:(context,i){
                        if(i.isOdd)return new Divider();

                        final index=i~/2;
                        if(index>=_suggestions.length){
                          _suggestions.addAll(generateWordPairs().take(10));
                        }
                        return _buildRow(_suggestions[index]);
                      } ,
                    ),

                  ),

    );
  }
  /// 下拉刷新方法,为list重新赋值
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        _suggestions.addAll(generateWordPairs().take(10));
      });
    });
  }
  Widget _buildRow(WordPair  pair){
    return new ListTile(
      title: new Text(pair.asPascalCase,  style:_biggerFont),
      onTap:(){
        Navigator.pushNamed(context, DetailRoute.routeName,arguments:true);
      },
    );


  }



}