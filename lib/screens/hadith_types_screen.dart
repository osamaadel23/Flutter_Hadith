import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/my_bullet.dart';

class HadithTypesScreen extends StatefulWidget {
  static const routeName = '/hadith-types';

  @override
  _HadithTypesScreenState createState() => _HadithTypesScreenState();
}

class _HadithTypesScreenState extends State<HadithTypesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center, child: Text('أنواع الأحاديث')),
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
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            HadithTypeCard(),
            HadithTypeCard(),
            HadithTypeCard(),
          ],
        ),
      ),
    );
  }
}

class HadithTypeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.only(bottom: 25.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.amber, width: 3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'الحديث الصحيح',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'الحديث الصحيح هو ما اتصل سنده بنقل العدل الضابط عن مثله من ابتداء السند إلى منتهاه من غير شذوذ أو علة.'),
            Text('ومعنى هذا أن الحديث الصحيح هو ما توافرت فيه الشروط التالية:'),
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text('ضبط الرواة'),
              ],
            ),
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text('اتصال السند'),
              ],
            ),
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text('ضبط الرواة'),
              ],
            ),
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text('عدم الشذوذ'),
              ],
            ),
            Row(
              children: <Widget>[
                MyBullet(),
                SizedBox(width: 10),
                Text('عدم العلة'),
              ],
            ),
            ListTile(
              trailing: SizedBox(
                width: 65,
                height: 30,
                child: FlatButton(
                  child: Icon(Icons.arrow_forward),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/hadithes-list');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
