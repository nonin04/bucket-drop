// dart format off
import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:flutter/material.dart';
enum BucketCategory{
  credit(
    id: 1,
    label: 'クレジットカード',
    icon: Icons.credit_card_outlined,
    balanceType: BalanceType.liability,
    sort: 0,
  ),
  cash(
    id: 2,
    label: '現金・電子マネー',
    icon: Icons.account_balance_wallet_outlined,
    balanceType: BalanceType.asset,
    sort: 1,
  ),
  bank(
    id: 3,
    label: '銀行口座',
    icon: Icons.account_balance_outlined,
    balanceType: BalanceType.asset,
    sort: 2,
  ),
  security(
    id: 3,
    label: '証券口座',
    icon: Icons.trending_up_outlined,
    balanceType: BalanceType.asset,
    sort: 2,
  ),

  point(
    id: 4,
    label: 'マイル・ポイント',
    icon: Icons.loyalty_outlined,
    balanceType: BalanceType.asset,
    sort: 3,
  ),
  other(
    id: 5,
    label: 'その他',
    icon: Icons.more_horiz_outlined,
    balanceType: BalanceType.asset,
    sort: 4,
  );

  const BucketCategory({
    required this.id,
    required this.label,
    required this.icon,
    required this.balanceType,
    required this.sort,
  });

  final int id;
  final String label;
  final IconData icon;
  final BalanceType balanceType;
  final int sort;

  bool get isBank => this == BucketCategory.bank;
  bool get isSecurity => this == BucketCategory.security;
  bool get isCash => this == BucketCategory.cash;
  bool get isCredit => this == BucketCategory.credit;
  bool get isPoint => this == BucketCategory.point;
  bool get isOther => this == BucketCategory.other;
}
