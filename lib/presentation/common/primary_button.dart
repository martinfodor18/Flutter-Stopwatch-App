import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String textKey;
  final Icon? leadingIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final bool outlined;
  final double height;
  final double radius;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.textKey,
    this.leadingIcon,
    this.backgroundColor,
    this.textColor,
    this.outlined = false,
    this.height = 56,
    this.radius = 32,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final bg = outlined
        ? Colors.transparent
        : backgroundColor ?? scheme.primary;

    final fg = textColor ??
        (outlined ? scheme.primary : Colors.white);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: outlined
                ? BorderSide(color: scheme.primary, width: 1.5)
                : BorderSide.none,
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                textKey.tr(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}