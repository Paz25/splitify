import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';

ElevatedButton buttonPrimary({
  Key? key,
  required BuildContext context,
  required String text,
  MaterialPageRoute? route,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    key: key,
    onPressed: () {
      if (route != null) {
        Navigator.push(context, route);
      }
      if (onPressed != null) {
        onPressed();
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: TColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
    ),
    child: Text(
      text,
      style: const TextStyle(color: TColors.whiteAccent),
    ),
  );
}