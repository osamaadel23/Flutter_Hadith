import 'package:flutter/material.dart';

class HadithDetail extends StatelessWidget {
  String content;
  HadithDetail(this.content);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              trailing: SizedBox(
                width: 140,
                height: 30,
                child: FlatButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label: Text('باقي الحديث'),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/hadith-content', arguments: content);
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
