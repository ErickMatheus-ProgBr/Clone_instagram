import 'package:flutter/widgets.dart';

class SettingsItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });
}
