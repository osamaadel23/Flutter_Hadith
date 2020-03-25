import 'package:flutter/material.dart';
import 'package:hadith_ui/widgets/hadith_view_card.dart';

import '../widgets/app_drawer.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center, child: Text('المفضلة')),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 7.0),
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      // endDrawer: AppDrawer(),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main20.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 25,
          ),
          children: <Widget>[
            HadithViewCard(),
            HadithViewCard(),
            HadithViewCard(),
          ],
        ),
      ),
    );
  }
}
