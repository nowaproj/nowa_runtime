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
  const DataBuilder({super.key, this.future, this.builder, this.loadingWidget, this.errorBuilder});

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

/// A flex widget that includes spacing
class NFlex extends StatelessWidget {
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final List<Widget> children;

  final double spacing;

  const NFlex({
    super.key,
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
    this.children = const <Widget>[],
  });

  Iterable<T> _interperse<T>(Iterable<T> iterable, T separator) sync* {
    final iterator = iterable.iterator;
    if (!iterator.moveNext()) return;
    yield iterator.current;
    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }

  bool get _shouldInterperse {
    switch (mainAxisAlignment) {
      case MainAxisAlignment.start:
      case MainAxisAlignment.end:
      case MainAxisAlignment.center:
        return spacing > 0;
      case MainAxisAlignment.spaceBetween:
      case MainAxisAlignment.spaceAround:
      case MainAxisAlignment.spaceEvenly:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> effectiveChildren;
    if (_shouldInterperse) {
      effectiveChildren = _interperse(children, SizedBox(width: spacing, height: spacing)).toList();
    } else {
      effectiveChildren = children;
    }

    return Flex(
      direction: direction,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: effectiveChildren,
    );
  }
}
