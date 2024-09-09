import 'package:flutter/material.dart';

class OrSection extends StatelessWidget {
  const OrSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 5,
          ),
        ),
        Text(
          'or',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 5,
          ),
        ),
      ],
    );
  }
}
