import 'package:flutter/material.dart';


enum CommonLoadMoreState {waiting, loading, finished}

class CommonLoadMoreView extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String waitingText;
  final String loadingText;
  final String noDataText;
  final Color textColor;
  final CommonLoadMoreState state;

  CommonLoadMoreView({
    this.icon = Icons.arrow_upward,
    this.iconColor = Colors.black38,
    this.waitingText = 'pull up to loading more',
    this.loadingText = 'loading more ...',
    this.noDataText = 'no more data',
    this.textColor = Colors.black38,
    this.state = CommonLoadMoreState.waiting
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 8.0,),
              state == CommonLoadMoreState.waiting? Icon(
                icon,
                color: iconColor
              ): state == CommonLoadMoreState.loading? CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(iconColor)
              ): SizedBox(),
              SizedBox(height: 8.0,),
              Text(
                state == CommonLoadMoreState.waiting? waitingText: state == CommonLoadMoreState.loading? loadingText: noDataText,
                style: TextStyle(
                    fontSize: 16.0,
                    color: textColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}