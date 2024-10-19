import 'package:flutter/material.dart';

class SvText extends StatelessWidget {
  const SvText(this.data, {super.key, this.style, this.maxline = 2});
  final String data;
  final TextStyle? style;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
    );
  }
}
