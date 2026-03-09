import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tracklancer"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: width < 600
            ? Column(
                children: buildCards(),
              )
            : Row(
                children: buildCards(),
              ),
      ),
    );
  }

  List<Widget> buildCards() {
    return [
      Expanded(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Upcoming Meetings"),
          ),
        ),
      ),
      SizedBox(width: 10, height: 10),
      Expanded(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Emails"),
          ),
        ),
      ),
      SizedBox(width: 10, height: 10),
      Expanded(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Freelance Tasks"),
          ),
        ),
      ),
    ];
  }
}
