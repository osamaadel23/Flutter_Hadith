import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../api/filter.dart';

class BooksScreen extends StatelessWidget {
  static const routeName = '/books';
  List heads = FilterMe.arabicHeads;
  List rHeads = FilterMe.heads;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center, child: Text('تصنيفات الكتب')),
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
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main20.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, i) => BooksCard(
            title: heads[i],
            name: rHeads[i],
          ),
        ),
      ),
    );
  }
}

class BooksCard extends StatefulWidget {
  final String title;
  final String name;
  BooksCard({
    @required this.title,
    @required this.name,
  });

  @override
  _BooksCardState createState() => _BooksCardState();
}

class _BooksCardState extends State<BooksCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? GestureDetector(
            onTap: () {
              setState(() {
                isLoading = true;
              });
              FilterMe filter = FilterMe();
              filter.filter(widget.name).then((onValue) {
                setState(() {
                  isLoading = false;
                });
                Navigator.of(context)
                    .pushNamed('/hadithes-list', arguments: onValue);
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.035, 0.02],
                    colors: [Theme.of(context).primaryColor, Colors.white]),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(stops: [
                        0.02,
                        0.02
                      ], colors: [
                        Theme.of(context).primaryColor,
                        Colors.amber
                      ]),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo.png",
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.11,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.27,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(0, 0, 0, 0.2),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Center(child: Text('جامع الأحاديث'))),
                      ],
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Center(child: Container(child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CircularProgressIndicator(),
        ),width: double.infinity,height: 75,));
  }
}
