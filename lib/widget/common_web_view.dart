import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'common_loading_view.dart';


class CommonWebView extends StatefulWidget {

  final String _url;
  final Color appBarBackgroundColor;
  final Color iconColor;
  final Color titleColor;

  CommonWebView(this._url, {
    this.iconColor = Colors.black87,
    this.titleColor = Colors.black87,
    this.appBarBackgroundColor = Colors.white
  });

  @override
  _CommonWebViewState createState() => new _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {

  String title = "";
  bool loading = true;
  double progress = 0.3;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print(url);
    });
    flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if(state.type == WebViewState.startLoad){
        setState(() {
          progress = 0.3;
          loading = true;
        });
      }else if(state.type == WebViewState.finishLoad){
        setState(() {
          progress = 1.0;
          loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: widget._url,
      appBar: new AppBar(
        backgroundColor: widget.appBarBackgroundColor,
        elevation: 3.0,
        title: Text(
          widget._url,
          style: TextStyle(
            color: widget.titleColor,
            fontSize: 14.0
          ),
        ),
        bottom: loading? PreferredSize(
          child: Container(
            height: 2.0,
            child: LinearProgressIndicator(value: progress,),
          ),
          preferredSize: Size.fromHeight(2.0),
        ): PreferredSize(
          child: SizedBox(height: 0.0,),
          preferredSize: Size.fromHeight(0.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.arrow_back, color: widget.iconColor,),
            onPressed: (){
              if (flutterWebViewPlugin != null) {
                flutterWebViewPlugin.goBack();
              }
            },
          ),
          new IconButton(
            icon: Icon(Icons.arrow_forward, color: widget.iconColor,),
            onPressed: (){
              if (flutterWebViewPlugin != null) {
                flutterWebViewPlugin.goForward();
              }
            },
          ),
          new IconButton(
            icon: Icon(Icons.refresh, color: widget.iconColor,),
            onPressed: (){
              if (flutterWebViewPlugin != null) {
                flutterWebViewPlugin.reload();
              }
            },
          ),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: CommonLoadingView(backgroundColor: Colors.transparent, progressColor: Colors.black54,),
    );
  }

}