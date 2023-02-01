import 'package:flutter/material.dart';

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
      style: color == null ? null : ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      child: child,
    );
  }
}

class DataBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(BuildContext, T)? builder;
  final Widget? loadingWidget;
  final Widget Function(BuildContext, dynamic)? errorBuilder;
  const DataBuilder({Key? key, this.future, this.builder, this.loadingWidget, this.errorBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder?.call(context, snapshot.data!) ?? const SizedBox();
        }
        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error) ?? const SizedBox();
        }

        return loadingWidget ?? const SizedBox();
      },
    );
  }
}

class FlexSizedBox extends StatelessWidget {
  final Widget child;
  final double? width, height;
  final int? flex;

  const FlexSizedBox({required this.child, this.width, this.height, this.flex, super.key});

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox(width: width, height: height, child: child);

    if (flex != null) {
      return Flexible(
        flex: flex!,
        fit: FlexFit.tight,
        child: widget,
      );
    }

    return widget;
  }
}
