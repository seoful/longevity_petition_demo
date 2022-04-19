import 'package:flutter/material.dart';

class VotesProgressBar extends StatelessWidget {
  const VotesProgressBar(
      {Key? key, this.fullBarValue = 1, this.currentBarValue = 1})
      : super(key: key);

  final int fullBarValue;
  final int currentBarValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${currentBarValue}".replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                    style: const TextStyle(
                      letterSpacing: 1,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF70FFB8),
                    ),
                  ),
                  const Text(
                    "Supporters",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF70FFB8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 3,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF55606A),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+${fullBarValue - currentBarValue}".replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF55606A).withOpacity(0.6),
                    ),
                  ),
                  Text(
                    "Needed",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF55606A).withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Expanded(
                flex: currentBarValue,
                child: Container(
                  color: Color(0xFF70FFB8),
                ),
              ),
              Expanded(
                flex: fullBarValue - currentBarValue,
                child: Container(
                  color: Color(0xFF55606A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
