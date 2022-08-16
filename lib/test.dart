import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.network(
              "https://images.pexels.com/photos/255379/pexels-photo-255379.jpeg?auto=compress&cs=tinysrgb&h=350"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).accentColor,
            shape: CircularNotchedRectangle(),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.access_alarm),
                  onPressed: () => null,
                ),
                IconButton(
                  icon: Icon(Icons.sms_failed),
                  onPressed: () => null,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Center(
              child: Icon(
                Icons.add,
                size: 32.0,
              ),
            ),
            onPressed: () {
              /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateEvent()),
                    );*/
            },
          ),
        ),
      ],
    );
  }
}
