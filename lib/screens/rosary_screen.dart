import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/tasbih_card.dart';

class RosaryScreen extends StatefulWidget {
  static const routeName = '/rosary';

  @override
  _RosaryScreenState createState() => _RosaryScreenState();
}

class _RosaryScreenState extends State<RosaryScreen> {
  double counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center, child: Text('السبحة')),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 7.0),
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                )),
                elevation: 5.0,
                color: Theme.of(context).canvasColor,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/main20.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 440,
                  child: ListView(
                    children: <Widget>[
                      TasbihCard(
                        text: 'سبحان الله',
                        counter: 5,
                      ),
                      TasbihCard(
                        text: 'الحمد لله',
                        counter: 2,
                      ),
                      TasbihCard(
                        text: 'لا اله الا الله',
                        counter: 20,
                      ),
                      TasbihCard(
                        text: 'الله اكبر',
                        counter: 4,
                      ),
                      TasbihCard(
                        text: 'استغفر الله',
                        counter: 9958,
                      ),
                      TasbihCard(
                        text: 'لا حول ولا قوة الا بالله',
                        counter: 99,
                      ),
                      TasbihCard(
                        text: 'سبحان الله وبحمده',
                        counter: 100,
                      ),
                      TasbihCard(
                        text: 'سبحان الله العظيم',
                        counter: 100,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: Text(
                          counter.ceil().toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                        iconSize: 50,
                        icon: Icon(
                          Icons.refresh,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
