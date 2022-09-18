import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitleWithButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String buttonText;

  const SectionTitleWithButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.buttonText = 'See More',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(buttonText),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
