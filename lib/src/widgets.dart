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

class StateWidget extends StatefulWidget {
  final dynamic state;
  final void Function()? initState;
  final void Function()? dispose;
  final Widget Function(BuildContext context, dynamic state, void Function(Function() fn) setState) builder;

  const StateWidget({
    required this.builder,
    this.state,
    this.initState,
    this.dispose,
    Key? key,
  }) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  @override
  void initState() {
    super.initState();

    widget.initState?.call();
  }

  @override
  void dispose() {
    widget.dispose?.call();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.state, setState);
  }
}

class Switchable extends StatelessWidget {
  final bool flag;
  final Widget? ifTrue;
  final Widget? ifFalse;
  const Switchable({this.flag = false, this.ifTrue, this.ifFalse, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flag ? ifTrue ?? Container() : ifFalse ?? Container();
  }
}

class DataBuilder extends StatelessWidget {
  final Future? future;
  final Widget Function(BuildContext, dynamic)? builder;
  final Widget? loadingWidget;
  final Widget Function(BuildContext, dynamic)? errorBuilder;
  const DataBuilder({Key? key, this.future, this.builder, this.loadingWidget, this.errorBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder?.call(context, snapshot.data) ?? const SizedBox();
        }
        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error) ?? const SizedBox();
        }

        return loadingWidget ?? const SizedBox();
      },
    );
  }
}
