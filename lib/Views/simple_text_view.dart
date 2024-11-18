import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class SimpleTextView extends StatelessWidget {
  var text;
  var textAlign;
  var maxLines;
  var color;
  var size;
  var fontFamilyName;
  var weight;
  var isLetterSpacing;
  var isHeight;
  var isUnderLine;

  SimpleTextView(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.maxLines = 100,
      this.color = Colors.white,
      this.size = 2.0,
      this.fontFamilyName = "",
      this.weight = FontWeight.w600,
      this.isLetterSpacing = false,
      this.isHeight = false,
      this.isUnderLine = false});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontSize: Constants.getSize(context, size),
            fontFamily: fontFamilyName,
            fontWeight: weight,
            letterSpacing: isLetterSpacing ? 0.6 : 0,
            height: isHeight ? Constants.getSize(0.2, context) : 0,
            decoration:
                isUnderLine ? TextDecoration.underline : TextDecoration.none));
  }
}
