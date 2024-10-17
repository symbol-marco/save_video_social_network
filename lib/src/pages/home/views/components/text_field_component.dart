import 'package:flutter/material.dart';
import 'package:save_video_social_network/src/generated/l10n.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({super.key, required this.filled});
  final bool filled;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 44,
      child: TextField(
        decoration: InputDecoration(
          hintText: S.current.hint_textfield_download,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: const Icon(Icons.paste_rounded),
          filled: filled,
          fillColor: Colors.blueGrey.withOpacity(0.2),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
