import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

/// Generic button widget
/// Reusable across all features for consistent button styling
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = isOutlined
        ? OutlinedButton.styleFrom(
            side: BorderSide(color: backgroundColor ?? theme.colorScheme.primary),
            foregroundColor: foregroundColor ?? theme.colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
          )
        : ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? theme.colorScheme.primary,
            foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
          );

    final child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                foregroundColor ?? theme.colorScheme.onPrimary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(text),
            ],
          );

    final button = isOutlined
        ? OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: buttonStyle,
            child: child,
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: buttonStyle,
            child: child,
          );

    return SizedBox(
      width: width,
      height: height ?? 48,
      child: button,
    );
  }
}
