import 'dart:async';

import 'package:bucket_drop/features/bucket/presentation/bucket_master_screen.dart';
import 'package:bucket_drop/features/drop/presentation/drop_category_master_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: const Text(
          '設定',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildSectionHeader('マスタ管理'),
          _buildSettingsCard(
            children: [
              _buildSettingTile(
                icon: Icons.account_balance_wallet_outlined,
                iconColor: Colors.blue,
                title: 'バケット管理',
                subtitle: '口座、財布、証券などの登録・編集',
                onTap: () {
                  // Navigator.push で遷移することでボトムナビゲーションバーを隠した画面を表示
                  unawaited(
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const BucketMasterScreen(),
                      ),
                    ),
                  );
                },
              ),
              const Divider(height: 1, indent: 56, color: Color(0xFFEEEEEE)),
              _buildSettingTile(
                icon: Icons.category_outlined,
                iconColor: Colors.orange,
                title: 'カテゴリー管理',
                subtitle: '支出・収入項目の登録・編集・並び替え',
                onTap: () {
                  unawaited(
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const DropCategoryMasterScreen(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('アプリ情報'),
          _buildSettingsCard(
            children: [
              _buildSettingTile(
                icon: Icons.info_outline,
                iconColor: Colors.grey.shade600,
                title: 'バージョン',
                trailingText: '1.0.0',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// セクション見出し
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }

  /// グループ化された角丸カード
  Widget _buildSettingsCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: children,
      ),
    );
  }

  /// 各設定行アイテム
  Widget _buildSettingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            )
          : null,
      trailing: trailingText != null
          ? Text(
              trailingText,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            )
          : const Icon(
              Icons.chevron_right,
              color: Colors.black26,
              size: 20,
            ),
      onTap: onTap,
    );
  }
}
