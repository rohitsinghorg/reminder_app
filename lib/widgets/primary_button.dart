import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final String? iconPath;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.iconPath,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).shadowColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 2.5.w)),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 7.5.w,
            vertical: verticalPadding ?? 1.5.h,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            Image.asset(
              iconPath!,
              width: 5.w,
              height: 5.w,
              color: Colors.white,
            ),
          if (iconPath != null)
            SizedBox(
              width: 2.5.w,
            ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
