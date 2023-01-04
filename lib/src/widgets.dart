import 'package:cloud_firestore/cloud_firestore.dart';
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
      child: child,
      style: color == null ? null : ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
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

class FirebaseBuilder<T> extends StatelessWidget {
  final bool updateAutomatic;
  final Query<T>? query;
  final Widget Function(BuildContext, List<T>)? builder;
  final Widget Function(BuildContext)? onLoadingBuilder;
  final Widget Function(BuildContext, Object? error)? onErrorBuilder;

  const FirebaseBuilder({
    super.key,
    this.query,
    this.updateAutomatic = true,
    this.builder,
    this.onLoadingBuilder,
    this.onErrorBuilder,
  });

  Widget _buildSnapshot(BuildContext context, AsyncSnapshot<QuerySnapshot<T>> snapshot) {
    if (snapshot.hasData) {
      return builder?.call(context, snapshot.data!.docs.map<T>((e) => e.data()).toList()) ?? Container();
    }
    if (snapshot.hasError) {
      return onErrorBuilder?.call(context, snapshot.error) ?? Container();
    }
    return onLoadingBuilder?.call(context) ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    if (query == null) {
      return onErrorBuilder?.call(context, Exception("Query not found")) ?? Container();
    }
    return updateAutomatic
        ? StreamBuilder<QuerySnapshot<T>>(stream: query!.snapshots(), builder: _buildSnapshot)
        : FutureBuilder<QuerySnapshot<T>>(future: query!.get(), builder: _buildSnapshot);
  }
}