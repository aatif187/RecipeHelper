import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  final String recipeUrl;
  RecipeView({this.recipeUrl});
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  String finalUrl = "";
  final Completer<WebViewController> completer =
      new Completer<WebViewController>();
  @override
  void initState() {
    if (widget.recipeUrl.contains("http://")) {
      finalUrl = widget.recipeUrl.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.recipeUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 24, left: 24, top: 30, bottom: 16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [const Color(0xff213A50), const Color(0xff071930)],
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Recipe",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                "Helper",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 72,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: finalUrl,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                completer.complete(webViewController);
              });
            },
          ),
        ),
      ])),
    );
  }
}
