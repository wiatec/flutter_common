import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class CommonWebView extends StatefulWidget {

  final String url;
  final Color appBarBackgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color progressColor;

  CommonWebView(this.url, {
    this.iconColor = Colors.black87,
    this.titleColor = Colors.black87,
    this.appBarBackgroundColor = Colors.white,
    this.progressColor = Colors.blue
  });

  @override
  _CommonWebViewState createState() => new _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {

  bool loading = true;
  double progress = 0.1;
  String _title = '';
  WebViewController _controller;


  void handlePageFinished()async {
    if(_controller == null) return;
    String title = await _controller.getTitle();
    setState(() {
      _title = title;
    });
  }

  Future<void> refreshPage()async {
    if(_controller == null) return;
    await _controller.reload();
  }

  Future<void> goBack()async {
    if(_controller == null) return;
    await _controller.goBack();
  }

  Future<void> goForward()async {
    if(_controller == null) return;
    await _controller.goForward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarBackgroundColor,
        centerTitle: false,
        title: Text(_title, style: TextStyle(color: widget.titleColor),),
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: widget.iconColor,),
            onPressed: (){
              goBack();
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: widget.iconColor,),
            onPressed: (){
              goForward();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh, color: widget.iconColor,),
            onPressed: (){
              refreshPage();
            },
          ),
        ],
        bottom: loading? PreferredSize(
          child: Container(
            height: 2.0,
            child: LinearProgressIndicator(value: progress, valueColor: AlwaysStoppedAnimation(widget.progressColor),),
          ),
          preferredSize: Size.fromHeight(2.0),
        ): PreferredSize(
          child: SizedBox(height: 0.0,),
          preferredSize: Size.fromHeight(0.0),
        ),
      ),
      body: Container(
        child: buildWebview(),
      ),
    );
  }


  Widget buildWebview(){
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: <JavascriptChannel>[_toasterJavascriptChannel(context),].toSet(),
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
        setState(() {
          progress = 0.3;
        });
      },
      navigationDelegate: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
      onPageFinished: (String url) {
        handlePageFinished();
        setState(() {
          progress = 1.0;
          loading = false;
        });
      },
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'test',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        }
    );
  }

}