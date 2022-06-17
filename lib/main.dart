import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

List<String> names = ['', ''];
bool _validate1 = false, _validate2 = false;

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User details'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    onChanged: (value) {
                      names[0] = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name 1',
                      hintText: 'Enter Name of User1',
                      errorText:
                          _validate1 ? 'User Name 1 cannot be empty' : '',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    onChanged: (value) {
                      names[1] = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name 2',
                      hintText: 'Enter Name of User2',
                      errorText:
                          _validate2 ? 'User Name 2 cannot be empty' : '',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Enter'),
                  onPressed: () {
                    setState(() {
                      names[0] == '' ? _validate1 = true : _validate1 = false;
                      names[1] == '' ? _validate2 = true : _validate2 = false;
                    });
                    print(names[0]);
                    print(names[1]);
                    if (names[0] != '' && names[1] != '')
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => game(names)
                              //return game();
                              ));
                  },
                )
              ],
            )));
  }
}
