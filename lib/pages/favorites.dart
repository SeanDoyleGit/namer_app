import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../namer_app.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NamerAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('remove favorite');
                  appState.removeFavorite(pair);

                  final snackBar = SnackBar(
                    content:
                        Text('Removed "${pair.asLowerCase}" from favorites.'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        appState.restoreFavorite(pair);
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )),
      ],
    );
  }
}
