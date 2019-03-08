import 'package:flutter/material.dart';
import 'package:flutter_crud_apis/Post.dart';
import 'package:flutter_crud_apis/services.dart';

void main() => runApp(MaterialApp(
      title: "Flutter CRUD APIs",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
    ));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD APIs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Choose a menu",
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  // TODO: do something in here
                },
                child: Text("Posts"),
              ),
              RaisedButton(
                onPressed: () {
                  // TODO: do something in here
                },
                child: Text("Comments"),
              ),
              RaisedButton(
                onPressed: () {
                  // TODO: do something in here
                },
                child: Text("Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
