import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactRows extends StatelessWidget {
  final String assetPath;
  final String text;
  const ContactRows({
    super.key,
    required this.assetPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          child: CircleAvatar(
            radius: 12,
            backgroundColor: theme.dividerColor,
            child: SvgPicture.asset(
              assetPath,
              height: 16,
            ),
          ),
        ),
        SizedBox(width: width * 0.005),
        Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
