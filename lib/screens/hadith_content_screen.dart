import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class HadithContentScreen extends StatefulWidget {
  static const routeName = '/hadith-content';

  @override
  _HadithContentScreenState createState() => _HadithContentScreenState();
}

class _HadithContentScreenState extends State<HadithContentScreen> {
  @override
  Widget build(BuildContext context) {
    final content = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center, child: Text('محتوى الأحاديث'))),
      // endDrawer: AppDrawer(),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 95),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hadith_cont2.png'),
            fit: BoxFit.fill,
            // colorFilter: ColorFilter.mode(Colors.transparent.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'البخاري',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            Text(
              'حديث صحيح',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                  ),
                ),
                Text(
                  'كتاب الصلاة',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                    content,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
