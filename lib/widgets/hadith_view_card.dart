import 'package:flutter/material.dart';

class HadithViewCard extends StatelessWidget {

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
              'حدثنا الحميدي عبد الله بن الزبير، قال حدثنا سفيان، قال حدثنا يحيى بن سعيد الأنصاري، قال أخبرني محمد بن إبراهيم التيمي، أنه سمع علقمة بن وقاص الليثي، يقول سمعت عمر بن الخطاب  رضى الله عنه  على المنبر قال سمعت رسول الله صلى الله عليه وسلم يقول ‏"‏ إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى، فمن كانت هجرته إلى دنيا يصيبها أو إلى امرأة ينكحها فهجرته إلى ما هاجر إليه ‏"‏‏.‏',
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
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
                    Navigator.of(context).pushNamed('/hadith-content');
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
