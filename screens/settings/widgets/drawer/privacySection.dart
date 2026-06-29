import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_tile_widget.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/usage_data.dart';

class PrivacySection extends StatelessWidget {
  const PrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = UsageData.getPrivacyItems(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Quem pode ver seus conteúdo",
              style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8),

        ...items.map((dynamicItem) => SettingsTile(item: dynamicItem)).toList(),
        const SizedBox(height: 5),
      ],
    );
  }
}
