import 'package:flutter/material.dart';
import 'package:flutter_crud_apis/domain/post/PostData.dart';
import 'package:flutter_crud_apis/services/post/PostServices.dart';
import 'package:flutter_crud_apis/ui/post/post_form_screen.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: FutureBuilder<List<PostData>>(
            future: getAllPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var postData = snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            // TODO: do something in here
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16.0),
                                child: Text(
                                  postData.title,
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0, left: 16.0),
                                child: Text(
                                  postData.author,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PostFormScreen(typeForm: "create");
              },
            ),
          );
        },
      ),
    );
  }
}
