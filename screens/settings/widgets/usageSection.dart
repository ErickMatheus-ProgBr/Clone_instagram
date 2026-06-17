import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_tile_widget.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/usage_data.dart';

class UsageSection extends StatelessWidget {
  const UsageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = UsageData.getUsageItems(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            "Como você usa o Instagram",
            style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),

        ...items.map((dynamicItem) => SettingsTile(item: dynamicItem)).toList(),
      ],
    );
  }
}
