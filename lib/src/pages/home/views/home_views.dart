import 'package:flutter/material.dart';

class HomeViews extends StatefulWidget {
  static const name = 'homepage';
  const HomeViews({super.key});
  @override
  State<HomeViews> createState() => _HomepageViewsState();
}

class _HomepageViewsState extends State<HomeViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity, height: double.infinity, color: Colors.white),
    );
  }
}
