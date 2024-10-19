import 'package:flutter/material.dart';
import 'package:save_video_social_network/src/components/animated_button.dart';
import 'package:save_video_social_network/src/components/widgets/sv_text.dart';
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextFieldComponent(filled: true),
            const AnimatedButton(),
            GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              childAspectRatio: 170 / 330,
              physics: const ClampingScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}

class _OptionItemContainer extends StatelessWidget {
  const _OptionItemContainer(
      {required this.background, required this.icon, required this.name});

  final Color background;
  final Widget icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(5)),
          ),
          const SvText('Tiktok')
        ],
      ),
    );
  }
}
