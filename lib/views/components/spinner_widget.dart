import 'package:flutter/material.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
          CircularProgressIndicator(
            // strokeWidth: defaultPadding / 3,
            backgroundColor: Colors.green,
          ),
        ]));
  }
}
