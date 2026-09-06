import 'package:flutter/material.dart';

class AppIcons {

  const AppIcons({
    required this.iconData,
    required this.name,
  });
  
  final IconData iconData;
  final String name;

  // デフォルトアイコン
  static const AppIcons defaultIcon = AppIcons(
    iconData: Icons.help_outline,
    name: 'help_outline',
  );

  // DBの 'restaurant' 等の文字列から復元するメソッド
  static AppIcons fromName(String? name) {
    if (name == null) return defaultIcon;
    return presets.firstWhere(
      (icon) => icon.name == name,
      orElse: () => defaultIcon,
    );
  }

  // プリセット一覧（あなたの書いたリストそのまま）
  static final List<AppIcons> presets = [
    const AppIcons(iconData: Icons.restaurant, name: 'restaurant'),
    const AppIcons(iconData: Icons.shopping_bag, name: 'shopping_bag'),
    const AppIcons(iconData: Icons.directions_bus, name: 'directions_bus'),
    const AppIcons(iconData: Icons.home, name: 'home'),
    const AppIcons(iconData: Icons.bolt, name: 'bolt'),
    const AppIcons(iconData: Icons.water_drop, name: 'water_drop'),
    const AppIcons(iconData: Icons.phone_iphone, name: 'phone_iphone'),
    const AppIcons(iconData: Icons.checkroom, name: 'checkroom'),
    const AppIcons(iconData: Icons.medical_services, name: 'medical_services'),
    const AppIcons(iconData: Icons.sports_esports, name: 'sports_esports'),
    const AppIcons(iconData: Icons.attractions, name: 'attractions'),
    const AppIcons(iconData: Icons.flight, name: 'flight'),
    const AppIcons(iconData: Icons.school, name: 'school'),
    const AppIcons(iconData: Icons.health_and_safety, name: 'health_and_safety'),
    const AppIcons(iconData: Icons.account_balance, name: 'account_balance'),
    const AppIcons(iconData: Icons.business_center, name: 'business_center'),
    const AppIcons(iconData: Icons.trending_down, name: 'trending_down'),
    const AppIcons(iconData: Icons.help_outline, name: 'help_outline'),
    const AppIcons(iconData: Icons.payments, name: 'payments'),
    const AppIcons(iconData: Icons.redeem, name: 'redeem'),
    const AppIcons(iconData: Icons.work, name: 'work'),
    const AppIcons(iconData: Icons.trending_up, name: 'trending_up'),
    const AppIcons(iconData: Icons.savings, name: 'savings'),
    const AppIcons(iconData: Icons.card_giftcard, name: 'card_giftcard'),
    const AppIcons(iconData: Icons.monetization_on, name: 'monetization_on'),
    const AppIcons(iconData: Icons.account_balance_wallet, name: 'account_balance_wallet'),
    const AppIcons(iconData: Icons.credit_card, name: 'credit_card'),
    const AppIcons(iconData: Icons.swap_horiz, name: 'swap_horiz'),
  ];
}
