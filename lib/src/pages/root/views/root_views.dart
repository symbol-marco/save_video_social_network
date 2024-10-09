import 'package:flutter/material.dart';

class RootViews extends StatefulWidget {
  const RootViews({super.key, required this.child});

  final Widget child;

  @override
  State<RootViews> createState() => _RootViewsState();
}

class _RootViewsState extends State<RootViews> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
