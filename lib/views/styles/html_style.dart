import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

final Map<String, Style> htmlStyle = {
  "*": Style(
    color: Colors.grey,
    fontSize: const FontSize(16.0),
  ),
  "h1": Style(
    fontWeight: FontWeight.w900,
    fontSize: const FontSize(20.0),
  ),
  "h2": Style(
    fontWeight: FontWeight.w900,
  ),
  "p": Style(
    fontWeight: FontWeight.w500,
    // border: const Border(bottom: BorderSide(color: Colors.grey)),
    padding: const EdgeInsets.all(16),
    fontSize: FontSize.larger,
  ),
  "b": Style(
    fontWeight: FontWeight.w900,
  ),
  "a": Style(
// color: Colors.blue,
    textDecoration: TextDecoration.none,
  ),
  "strong": Style(
    color: Colors.green,
  ),
// onLinkTap: (url, _, __, ___) async {
//   try {
//     if (url != null && await canLaunch(url)) {
//       await launch(
//         url,
//         // these mean the link opens in browser
//         forceSafariVC: false,
//         forceWebView: false,
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   } on Exception catch (e) {
//     Logger.logDebug('$e');
//   }
};
