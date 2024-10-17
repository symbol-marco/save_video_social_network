import 'package:flutter/material.dart';
import 'package:save_video_social_network/src/generated/l10n.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        tween: Tween(begin: 1.0, end: !_isPressed ? 0.95 : 0.85),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              alignment: Alignment.center,
              height: 40,
              width: !_isPressed ? 190 : 200,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInCubic,
              decoration: BoxDecoration(
                color: !_isPressed ? Colors.white : const Color(0xff0072ff),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xff0072ff)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: !_isPressed ? 4 : 6,
                      offset:
                          !_isPressed ? const Offset(0, 2) : const Offset(0, 4))
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Text(
                S.current.download,
                style: TextStyle(
                    color: !_isPressed ? const Color(0xff0072ff) : Colors.white,
                    fontWeight:
                        !_isPressed ? FontWeight.normal : FontWeight.bold,
                    fontSize: 16,
                    height: 0.4),
              ),
            ),
          );
        },
      ),
    );
  }
}
