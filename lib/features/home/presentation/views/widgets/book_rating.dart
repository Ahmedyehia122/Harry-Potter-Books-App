import 'package:bookly_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 14,
        ),
        SizedBox(width: 4.w),
        Text(
          '4.8',
          style: AppStyles.textStyle16,
        ),
        SizedBox(width: 2.w),
        Text(
          '(2203)',
          style: AppStyles.textStyle14,
        )
      ],
    );
  }
}
