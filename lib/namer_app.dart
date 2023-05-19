import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/root.dart';

class NamerApp extends StatelessWidget {
  const NamerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NamerAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: RootPage(),
      ),
    );
  }
}

class NamerAppState extends ChangeNotifier {
  var word = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    word = WordPair.random();
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }

  void addFavorite(WordPair pair) {
    favorites.add(pair);
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(word)) {
      removeFavorite(word);
    } else {
      addFavorite(word);
    }
  }
}
