import 'package:flutter/material.dart';

class gameOutput extends StatelessWidget {
  final String output;
  const gameOutput({super.key, required this.output});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Winner'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  output,
                  style: TextStyle(fontSize: 22.0),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Try again'),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ],
            )));
  }
}
