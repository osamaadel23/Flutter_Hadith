import 'package:flutter/material.dart';
import 'package:hadith_ui/widgets/hadithDetail.dart';
import '../widgets/app_drawer.dart';
import '../widgets/hadith_view_card.dart';

class HadithesListScreen extends StatefulWidget {
  static const routeName = '/hadithes-list';
  @override
  _HadithesListScreenState createState() => _HadithesListScreenState();
}

class _HadithesListScreenState extends State<HadithesListScreen> {
  @override
  Widget build(BuildContext context) {
     List content =  ModalRoute.of(context).settings.arguments ;
     
    return Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center, child: Text('الأحاديث')),
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
        child: ListView.builder(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 25,
          ),
         itemBuilder: (ctx,i) => HadithDetail(content[i]),
        ),
      ),
    );
  }
}
