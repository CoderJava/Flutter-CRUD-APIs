import 'package:flutter/material.dart';

class PostFormScreen extends StatefulWidget {
  String typeForm;

  PostFormScreen({@required this.typeForm});

  @override
  _PostFormScreenState createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.typeForm == "create" ? "Post Create" : "Post Update/Delete"),
      ),
      body: Center(
        child: Text(
          "Hello world",
        ),
      ),
    );
  }
}
