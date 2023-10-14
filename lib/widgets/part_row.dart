import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PartRow extends StatelessWidget {
  final String text;
  const PartRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Text(
                'See more',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Gap(4),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.green,
              ),
              Gap(10),
            ],
          ),
        ),
      ],
    );
  }
}
