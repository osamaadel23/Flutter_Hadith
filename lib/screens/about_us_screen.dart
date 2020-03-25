import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  static const routeName = '/about-us';

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: Text('عن التطبيق')),
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
        // padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                'عن التطبيق:',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'تطبيق جامع الأحاديث هو تطبيق شامل للموسوعة الحديثية وهدفه الحفاظ على السنة وميراث النبوة, والريادة والتميز في ايجاد مرجعية علمية على منهج أهل السنة والجماعه للمسلمين كافة في أنحاء العالم, ويحوي عددا كبيراً من الامكانيات والمميزات المتطورة مثل :',
                style: TextStyle(letterSpacing: 4.0),
              ),
            ),
            FeatureCard(
              text: 'بحث سريع ومتقدم في مئات الآلاف من الاحاديث.',
            ),
            FeatureCard(
              text: 'معرفة الحديث الصحيح والضعيف والموضوع.',
            ),
            FeatureCard(
              text: 'تخريج الاحاديث من مصادرها الأصلية.',
            ),
            FeatureCard(
              text: 'شرح مختصر وسهل للحديث في الاصدار القادم.',
            ),
            FeatureCard(
              text: 'قراءة الاحاديث بدون اتصال بالانترنت.',
            ),
            FeatureCard(
              text: 'اضافة الحديث للمفضلة.',
            ),
            FeatureCard(
              text: 'ومميزات اخرى.',
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String text;

  FeatureCard({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(Icons.done_outline),
        title: Text(text),
      ),
    );
  }
}
