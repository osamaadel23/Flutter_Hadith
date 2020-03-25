import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../widgets/app_drawer.dart';
import '../widgets/my_bullet.dart';

class QuizesScreen extends StatefulWidget {
  static const routeName = '/quizes';

  @override
  _QuizesScreenState createState() => _QuizesScreenState();
}

class _QuizesScreenState extends State<QuizesScreen> {
  var _radioGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: Text('أسئلة متنوعة')),
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
          padding: EdgeInsets.all(15),
          children: <Widget>[
            QuestionCard(),
            QuestionCard(),
            QuestionCard(),
            QuestionCard(),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text(
                  'من هو ثالث الخلفاء الراشدين؟',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            RadioButtonGroup(
              labels: [
                'ابو بكر الصديق',
                'على بن ابي طالب ',
                'عمر بن عبد العزيز',
                'عثمان بن عفان',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
