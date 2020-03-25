import 'package:flutter/material.dart';

class TasbihCard extends StatelessWidget {
  final String text;
  final int counter;

  TasbihCard({
    @required this.text,
    @required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // width: MediaQuery.of(context).size.width*0.6,
            child: Text(
              text,
            ),
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: null,
                onChanged: null,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.09,
                child: Text(
                  counter.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
