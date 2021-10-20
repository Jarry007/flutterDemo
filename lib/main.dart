import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'views/first.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(title: '第二个flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('开始滚动吧'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const secondPage();
                }));
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  // final Set<WordPair> _saved =  Set<WordPair>();
  final Set<WordPair> _saved = <WordPair>{};

  Widget _buildRow(WordPair pair) {
    final bool hasSaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(
        hasSaved ? Icons.favorite : Icons.favorite_border,
        color: hasSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (hasSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

// ignore: camel_case_types
class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  _secondPageState createState() => _secondPageState();
}

// ignore: camel_case_types
class _secondPageState extends State<secondPage> {
  int _username = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子页面"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey,
          child: Column(children: [
            InkWell(
                onTap: () {
                  // ignore: avoid_print
                  print('点击了文字');
                },
                child: const Image(
                  image: AssetImage("assets/img/1212.jpg"),
                  height: 160,
                  fit: BoxFit.cover,
                )),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            NeumorphicButton(
              onPressed: () => btnClick(),
              margin: const EdgeInsets.only(top: 20),
              style: const NeumorphicStyle(
                  shape: NeumorphicShape.flat, color: Colors.blueGrey),
              padding: const EdgeInsets.all(18.0),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            const NeumBtn()
          ])),
    );
  }

  @override
  void btnClick() {
    setState(() {
      _username++;
    });

    // ignore: avoid_print
    print(_username);
  }
}

// 在flutter中，生成web端时是一个 canvas 


// final ~ let