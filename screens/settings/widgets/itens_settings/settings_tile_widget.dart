import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_item.dart';

class SettingsTile extends StatelessWidget {
  final SettingsItem item;
  const SettingsTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: item.onTap,
      leading: Icon(item.icon, color: item.iconColor, size: 28),
      title: Text(item.title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, color: item.iconColor),
    );
  }
}
