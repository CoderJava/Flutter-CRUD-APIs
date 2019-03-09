import 'package:flutter/material.dart';
import 'package:flutter_crud_apis/profile_screen.dart';
import 'package:flutter_crud_apis/comment_screen.dart';
import 'package:flutter_crud_apis/ui/post/post_screen.dart';

void main() => runApp(MaterialApp(
      title: "Flutter CRUD APIs",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/posts": (context) {
          return PostScreen();
        },
        "/comments": (context) {
          return CommentScreen();
        },
        "/profile": (context) {
          return ProfileScreen();
        }
      },
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
                  Navigator.pushNamed(context, "/posts");
                },
                child: Text("Posts"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/comments");
                },
                child: Text("Comments"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
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
