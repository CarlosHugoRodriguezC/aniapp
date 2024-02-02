import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme(
      :labelMedium,
    ) = Theme.of(context).textTheme;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FilledButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
          ),
        ),
        label: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            label.toUpperCase(),
            style: labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        icon: Directionality(
          textDirection: TextDirection.ltr,
          child: Icon(icon),
        ),
      ),
    );
  }
}
