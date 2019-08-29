// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class WordGenerator extends StatefulWidget {
  @override
  WordGeneratorState createState() => WordGeneratorState();
}

class WordGeneratorState extends State<WordGenerator> {
  var word = WordPair.random();
  var color = Color(0xffa5de16);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment(0.0, 0.8),
              child: Text(word.asPascalCase),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        word = WordPair.random();
                        color = Color(0xff6f960e);
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        color = Color(0xffa5de16);
                      });
                    },
                    child: AnimatedContainer(
                        padding: EdgeInsets.all(12.0),
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text('Gerar Palavra')),
                  )))
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Welcome to Flutter')),
        ),
        body: WordGenerator(),
      ),
    );
  }
}
