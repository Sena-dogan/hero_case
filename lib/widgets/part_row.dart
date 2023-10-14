import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'See more',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(4),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.green,
              ),
              const Gap(10),
            ],
          ),
        ),
      ],
    );
  }
}
