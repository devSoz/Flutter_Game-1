import 'gameOutput.dart';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  @override
  //final String names;
  List<String> names = ['', ''];
  //String test;
  List<String> selection = ['', ''];
  int userSelected = 0;
  String output = '';
  game(List<String> names) {
    this.names = names;
    this.output = '';
    this.userSelected = 0;
  }

  void checkSelection(BuildContext context, List<String> names) {
    if (userSelected == 1) {
      if (selection[0] == selection[1])
        output = 'Its a tie';
      else if (selection[0] == 'Scissor') {
        if (selection[1] == 'Stone')
          output = names[1] + ' wins';
        else
          output = names[0] + ' wins';
      } else if (selection[0] == 'Paper') {
        if (selection[1] == 'Scissor')
          output = names[1] + ' wins';
        else
          output = names[0] + ' wins';
      } else {
        if (selection[1] == 'Paper')
          output = names[1] + ' wins';
        else
          output = names[0] + ' wins';
      }
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => gameOutput(output: output)
              //return game();
              ));
    } else
      userSelected = 1;
  }

  //const game({super.key, required this.names});
  _State createState() => _State();
}

class _State extends State<game> {
  // const _State({super.key, required this.name1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stone-Paper-Scissor Game'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                'User - ' + widget.names[widget.userSelected],
                style: TextStyle(fontSize: 22.0),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                  child: Text(
                    'Pick any of the below',
                    style: TextStyle(fontSize: 15.0),
                  )),
              Row(children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selection[widget.userSelected] = 'Paper';
                        widget.checkSelection(context, widget.names);
                      });
                    },
                    child: Image.asset(
                      'assets/images/paper.png',
                      height: 150,
                      width: 150,
                    )),
                Text(
                  '  Paper',
                  style: TextStyle(fontSize: 30.0),
                )
              ]),
              Row(children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selection[widget.userSelected] = 'Stone';
                        widget.checkSelection(context, widget.names);
                      });
                    },
                    child: Image.asset(
                      'assets/images/stone.jpg',
                      height: 150,
                      width: 150,
                    )),
                Text(
                  '  Stone',
                  style: TextStyle(fontSize: 30.0),
                )
              ]),
              Row(children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selection[widget.userSelected] = 'Scissor';
                        widget.checkSelection(context, widget.names);
                      });
                    },
                    child: Image.asset(
                      'assets/images/scissor.jpg',
                      height: 150,
                      width: 150,
                    )),
                Text(
                  '  Scissor',
                  style: TextStyle(fontSize: 30.0),
                )
              ])
            ],
          ),
        ));
  }
}
