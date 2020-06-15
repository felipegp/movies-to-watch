import 'package:flutter/material.dart';
import 'package:movies_to_watch/shred/variables.dart';

class ButtonHeader extends StatelessWidget {
  final String text;
  final Function clickHandler;
  final bool active;

  ButtonHeader({ this.text, this.clickHandler, this.active });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: RaisedButton(
        color: active ? Variables.secondary : Variables.primary,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: active ? Variables.primary : Variables.secondary
          )
        ),
        shape: RoundedRectangleBorder(side: BorderSide(color: Variables.secondary, width: 1.0)),
        onPressed: () => clickHandler(text)
      )
    );
  }
}
