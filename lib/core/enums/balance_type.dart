/// バケツの正負・会計上の区分（資産 or 負債）
enum BalanceType {
  /// 資産（プラスの資産: 現金、銀行、投資、ポイントなど）
  asset(
    label: 'asset',
    sign: 1,
  ),

  /// 負債（マイナスの資産: クレカ未払、借入、ローンなど）
  liability(
    label: 'liability',
    sign: -1,
  );

  const BalanceType({
    required this.label,
    required this.sign,
  });

  /// 表示用ラベル（日本語）
  final String label;

  /// 純資産計算などに使う符号係数 (+1 または -1)
  final int sign;

  /// 資産かどうか
  bool get isAsset => this == BalanceType.asset;

  /// 負債かどうか
  bool get isLiability => this == BalanceType.liability;
}
