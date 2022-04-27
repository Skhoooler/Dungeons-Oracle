import 'package:flutter/material.dart';
import 'colors.dart' as colors;

class DOContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;

  const DOContainer({Key? key, required this.child, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * .93,
      height: height,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: colors.accentColor ?? Colors.red, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: child,
    );
  }
}
