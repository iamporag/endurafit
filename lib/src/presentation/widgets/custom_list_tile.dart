import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final String? title;
  final bool? isRichText;
  final bool? isTrailingIcon;
  final String? firstRichTextTitle;
  final String? secondRichTextTitle;
  final String? subTitle;
  final String? actionTitle;
  final IconData? trailingIcon;
  final Function()? onTap;
  const CustomListTile({
    super.key,
    this.title,
    this.subTitle,
    this.actionTitle,
    this.onTap,
    this.isRichText,
    this.firstRichTextTitle,
    this.secondRichTextTitle,
    this.isTrailingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: isRichText! ? RichText(
        text: TextSpan(
            text: firstRichTextTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: secondRichTextTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
      ): Text(
        title!,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ) ,
      trailing: InkWell(
        onTap: onTap,
        child: isTrailingIcon! ? Icon(
          trailingIcon,
          color: Colors.grey,
        ) : Text(
          actionTitle!,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


