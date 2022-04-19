import 'package:flutter/material.dart';

import 'animated_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    this.title = "",
    this.leading,
    this.trailing,
    this.onLeadingTap,
    this.onTrailingTap,
    this.padding,
    this.iconsColor = Colors.black,
    this.iconsSize = 25,
    this.titleColor = Colors.black,
  }) : super(key: key);

  final String title;
  final IconData? leading;
  final IconData? trailing;
  final void Function()? onLeadingTap;
  final void Function()? onTrailingTap;
  final Color iconsColor;
  final Color titleColor;
  final double iconsSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedButton(
                onTap: () => onLeadingTap?.call(),
                child: Icon(
                  leading,
                  color: leading == null ? Colors.transparent : iconsColor,
                  size: iconsSize,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: titleColor,
                ),
              ),
              AnimatedButton(
                child: Icon(
                  trailing,
                  color: trailing == null ? Colors.transparent : iconsColor,
                  size: iconsSize,
                ),
                onTap: () => onTrailingTap?.call(),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 10,),
        const Divider(
          height: 0.5,
          color: Colors.black,
        ),
      ],
    );
  }
}
