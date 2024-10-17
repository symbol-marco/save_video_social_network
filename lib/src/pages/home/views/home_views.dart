import 'package:flutter/material.dart';
import 'package:save_video_social_network/src/components/animated_button.dart';
import 'package:save_video_social_network/src/pages/home/views/components/text_field_component.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: TextFieldComponent(filled: true),
          ),
          const AnimatedButton(),
          Container(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return null;
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.0,
                  mainAxisExtent: 2.0,
                  childAspectRatio: 0.36),
            ),
          )
        ],
      ),
    );
  }
}
