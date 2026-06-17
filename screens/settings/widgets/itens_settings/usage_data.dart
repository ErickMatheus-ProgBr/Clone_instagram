import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_item.dart';
// Ajuste este import para apontar corretamente para o seu settings_item.dart

class UsageData {
  static List<SettingsItem> getUsageItems(BuildContext context) {
    return [
      SettingsItem(
        icon: Icons.bookmark_border_rounded,
        iconColor: Colors.white,
        title: "Salvos",
        onTap: () => print("Abriu Salvos"),
      ),
      SettingsItem(
        icon: Icons.history_rounded,
        iconColor: Colors.white,
        title: "Itens Arquivados",
        onTap: () => print("Abriu Arquivados"),
      ),
      SettingsItem(
        icon: Icons.analytics_outlined,
        iconColor: Colors.white,
        title: "Sua atividade",
        onTap: () => print("Abriu Sua atividade"),
      ),
      SettingsItem(
        icon: Icons.notifications_none_rounded,
        iconColor: Colors.white,
        title: "Notificações",
        onTap: () => print("Abriu Notificações"),
      ),
      SettingsItem(
        icon: Icons.access_time_rounded,
        iconColor: Colors.white,
        title: "Gerenciamento de tempo",
        onTap: () => print("Abriu Gerenciamento de tempo"),
      ),
      SettingsItem(
        icon: Icons.stars_outlined,
        iconColor: Colors.white,
        title: "Acesso antecipado ao Instagram",
        onTap: () => print("Abriu Acesso antecipado"),
      ),
      SettingsItem(
        icon: Icons.tablet_mac_rounded,
        iconColor: Colors.white,
        title: "Instagram para iPad",
        onTap: () => print("Abriu Instagram para iPad"),
      ),
    ];
  }

  static List<SettingsItem> getPrivacyItems(BuildContext context) {
    return [
      SettingsItem(
        icon: Icons.lock_outline_rounded,
        iconColor: Colors.white,
        title: "Privacidade da conta",
        onTap: () => print("Abriu Privacidade da conta"),
      ),
      SettingsItem(
        icon: Icons.star_border_rounded,
        iconColor: Colors.white,
        title: "Amigos Próximos",
        onTap: () => print("Abriu Amigos Próximos"),
      ),
      SettingsItem(
        icon: Icons.block_flipped,
        iconColor: Colors.white,
        title: "Bloqueados",
        onTap: () => print("Abriu Bloqueados"),
      ),
      SettingsItem(
        icon: Icons.assignment_ind_outlined,
        iconColor: Colors.white,
        title: "Ocultar história e transmissão ao vivo",
        onTap: () => print("Abriu Ocultar história"),
      ),
    ];
  }
}
