import 'package:flutter/material.dart';
import 'package:rent_flow_project/Views/simple_text_view.dart';

import '../Utils/constants.dart';

class SimpleButton extends StatelessWidget {
  final double horizontalPadding;
  final double radius;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double height;
  final String title;
  final VoidCallback onClick;
  final Color borderColor;
  final double borderWidth;
  final double elevationSize;
  final bool isBorder;

  SimpleButton({
    super.key,
    this.horizontalPadding = 3,
    this.radius = 2,
    this.isLoading = false,
    this.height = 6.5,
    this.elevationSize = 10,
    required this.title,
    required this.onClick,
    this.color = Colors.green,
    this.textColor = Colors.black,
    this.isBorder = false,
    this.borderColor = Colors.black, // Default border color
    this.borderWidth = 0.1, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.getSize(context, height),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.getSize(context, horizontalPadding),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              Constants.getSize(context, radius),
            ),
            border: isBorder ? Border.all(
              color: borderColor,
              width: Constants.getSize(context, borderWidth),
            ) : null, // Adding border
          ),
          child: Material(
            color: color,
            elevation: elevationSize, // Shadow effect
            borderRadius:
                BorderRadius.circular(Constants.getSize(context, radius)),
            child: InkWell(
              onTap: onClick,
              borderRadius:
                  BorderRadius.circular(Constants.getSize(context, radius)),
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleTextView(
                            text: title,
                            color: textColor,
                            size: 1.4,
                            weight: FontWeight.w800,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
