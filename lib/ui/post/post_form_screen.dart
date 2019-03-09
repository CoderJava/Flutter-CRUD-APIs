import 'package:flutter/material.dart';
import 'package:flutter_crud_apis/domain/post/PostData.dart';
import 'package:flutter_crud_apis/services/post/PostServices.dart';

final _scaffoldGlobalKey = GlobalKey<ScaffoldState>();
final _titleFieldGlobalKey = GlobalKey<_TitleTextFieldWidgetState>();
final _authorFieldGlobalKey = GlobalKey<_AuthorTextFieldWidgetState>();

class PostFormScreen extends StatefulWidget {
  final String typeForm;

  PostFormScreen({@required this.typeForm});

  @override
  _PostFormScreenState createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  bool _isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double paddingBottom = mediaQuery.padding.bottom;
    double paddingBottomScreen = paddingBottom > 0 ? 0 : 16.0;

    return Scaffold(
      key: _scaffoldGlobalKey,
      appBar: AppBar(
        title: Text(
            widget.typeForm == "create" ? "Post Create" : "Post Update/Delete"),
      ),
      body: Stack(
        children: _buildBodyWidget(paddingBottomScreen),
      ),
    );
  }

  List<Widget> _buildBodyWidget(double paddingBottomScreen) {
    Form form = Form(
      child: PostInheritedWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: paddingBottomScreen,
              left: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TitleTextFieldWidget(key: _titleFieldGlobalKey),
                AuthorTextFieldWidget(key: _authorFieldGlobalKey),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            String title = _titleFieldGlobalKey
                                .currentState.titleTextEditingController.text
                                .trim();
                            String author = _authorFieldGlobalKey
                                .currentState.authorTextEditingController.text
                                .trim();
                            if (title.isEmpty || author.isEmpty) {
                              return;
                            }

                            setState(() {
                              _isApiCallProcess = true;
                            });
                            createPost(PostData(title: title, author: author))
                                .then((response) {
                              setState(() {
                                _isApiCallProcess = false;
                              });
                              if (response.statusCode == 201) {
                                Navigator.pop(context);
                              } else {
                                _scaffoldGlobalKey.currentState.showSnackBar(SnackBar(
                                    content: Text("Create data failed")));
                              }
                            });
                          },
                          child: Text(
                            "Create Data".toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.blue,
                          padding: EdgeInsets.only(
                            top: 12.0,
                            bottom: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    var listWidget = List<Widget>();
    listWidget.add(form);

    if (_isApiCallProcess) {
      var modal = Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: const ModalBarrier(
              dismissible: false,
              color: Colors.grey,
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
      listWidget.add(modal);
    }
    return listWidget;
  }
}

class PostInheritedWidget extends InheritedWidget {
  final errorMessage = "Make sure you fill this field";

  const PostInheritedWidget({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static PostInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(PostInheritedWidget)
        as PostInheritedWidget;
  }

  @override
  bool updateShouldNotify(PostInheritedWidget old) {
    return true;
  }
}

class TitleTextFieldWidget extends StatefulWidget {
  TitleTextFieldWidget({Key key}) : super(key: key);

  @override
  _TitleTextFieldWidgetState createState() => _TitleTextFieldWidgetState();
}

class _TitleTextFieldWidgetState extends State<TitleTextFieldWidget> {
  TextEditingController _titleTextEditingController = TextEditingController();
  bool _isFieldTitleValid = true;

  TextEditingController get titleTextEditingController =>
      _titleTextEditingController;

  @override
  Widget build(BuildContext context) {
    final PostInheritedWidget postInheritedWidget =
        PostInheritedWidget.of(context);

    return TextFormField(
      controller: _titleTextEditingController,
      decoration: InputDecoration(
        labelText: "Title",
        errorText: _isFieldTitleValid ? null : postInheritedWidget.errorMessage,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _titleTextEditingController.addListener(() {
      setState(() {
        _isFieldTitleValid = _titleTextEditingController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    super.dispose();
  }
}

class AuthorTextFieldWidget extends StatefulWidget {
  AuthorTextFieldWidget({Key key}) : super(key: key);

  @override
  _AuthorTextFieldWidgetState createState() => _AuthorTextFieldWidgetState();
}

class _AuthorTextFieldWidgetState extends State<AuthorTextFieldWidget> {
  TextEditingController _authorTextEditingController = TextEditingController();
  bool _isFieldAuthorValid = true;

  TextEditingController get authorTextEditingController =>
      _authorTextEditingController;

  @override
  Widget build(BuildContext context) {
    final PostInheritedWidget postInheritedWidget =
        PostInheritedWidget.of(context);

    return TextFormField(
      controller: _authorTextEditingController,
      decoration: InputDecoration(
        labelText: "Author",
        errorText:
            _isFieldAuthorValid ? null : postInheritedWidget.errorMessage,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _authorTextEditingController.addListener(() {
      setState(() {
        _isFieldAuthorValid =
            _authorTextEditingController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _authorTextEditingController.dispose();
    super.dispose();
  }
}
