import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconsButton extends StatelessWidget {
  final String imageUrl;
  const SocialIconsButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0, color: Colors.black),
      ),
      child: SvgPicture.asset(
        imageUrl,
        width: 48,
      ),
    );
  }
}
