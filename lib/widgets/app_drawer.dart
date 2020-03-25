import 'dart:io' as io;
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 110,
            width: double.infinity,
            // padding: EdgeInsets.only(top: 25),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(width: 20),
                Text(
                  'جامع الأحاديث',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('الصفحة اللي هتبقا فيها البحث'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/search-results');
            },
          ),
          Divider(),
          ListTile(
            title: Container(child: Text(' الأحاديث')),
            leading: Container(child: Icon(Icons.bookmark)),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Container(child: Text('الأحاديث الصحيحة')),
            leading: Container(child: Icon(Icons.layers)),
          ),
          Divider(),
          ListTile(
            title: Container(child: Text('الأحاديث الضعيفة')),
            leading: Container(child: Icon(Icons.layers)),
          ),
          Divider(),
          ListTile(
            title: Container(child: Text('الأحاديث الموضوعة')),
            leading: Container(child: Icon(Icons.layers_clear)),
          ),
          Divider(),
          ListTile(
            title: Container(child: Text('عن التطبيق')),
            leading: Container(child: Icon(Icons.info)),
            onTap: () {
              Navigator.of(context).pushNamed('/about-us');
            },
          ),
          Divider(),
          ListTile(
            title: Container(child: Text('خروج')),
            leading: Container(child: Icon(Icons.exit_to_app)),
            onTap: () {
              io.exit(0);
            },
          ),
        ],
      ),
    );
  }
}
