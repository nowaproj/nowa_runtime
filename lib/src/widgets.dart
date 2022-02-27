import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? color;
  final Border? border;
  final double? borderRadius;
  final Widget? child;
  const CustomContainer({
    this.padding,
    this.width,
    this.height,
    this.color,
    this.border,
    this.borderRadius,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      ),
      child: child,
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Widget? child;
  final Color? color;
  const CustomButton({this.onPressed, this.child, this.color, this.onLongPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: child,
      style: color == null ? null : ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
    );
  }
}
