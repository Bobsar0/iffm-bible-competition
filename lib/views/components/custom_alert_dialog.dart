import 'package:flutter/material.dart';

import 'custom_button.dart';

class ModalDialog {
  ModalDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? actionBtnText,
    Color? actionBtnColor = Colors.green,
    String? cancelBtnText,
    Color? cancelBtnColor,
    Function? onActionBtnPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => _CustomAlertDialog(
          context: context,
          title: title,
          message: message,
          actionBtnText: actionBtnText,
          actionBtnColor: actionBtnColor,
          cancelBtnText: cancelBtnText,
          cancelBtnColor: cancelBtnColor,
          onActionBtnPressed: onActionBtnPressed),
    );
  }
}

/// Do not call this class directly. Use ModalDialog class instead
class _CustomAlertDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String message;
  final String? actionBtnText;
  final String? cancelBtnText;
  final Color? actionBtnColor;
  final Color? cancelBtnColor;
  final Function? onActionBtnPressed;

  _CustomAlertDialog({
    Key? key,
    required this.context,
    required this.title,
    required this.message,
    this.actionBtnText = 'Yes',
    this.actionBtnColor = Colors.green,
    this.cancelBtnColor,
    this.cancelBtnText,
    this.onActionBtnPressed,
  }) : super(key: key);

  List<Widget> get _actions => <Widget>[
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            if (onActionBtnPressed != null)
              CustomButton(
                text: actionBtnText!,
                backgroundColor: actionBtnColor,
                onPressed: () async {
                  Navigator.pop(context);
                  await onActionBtnPressed!();
                },
              ),
            if (cancelBtnText != null)
              CustomButton(
                text: cancelBtnText!,
                textColor: Colors.grey,
                backgroundColor: cancelBtnColor,
                onPressed: () => Navigator.pop(context),
              ),
          ],
        )
      ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.grey,
      title: Column(
        children: [
          // Align(alignment: Alignment.centerRight, child: CustomCloseButton()),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      titleTextStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      content: Text(message, textAlign: TextAlign.center),
      contentTextStyle: TextStyle(
          fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500),
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      actions: _actions,
      actionsPadding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
