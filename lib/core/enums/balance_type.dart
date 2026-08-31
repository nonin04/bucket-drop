enum BalanceType {
  asset(
    label: 'asset',
    id: 1,
    sign: 1,
  ),

  liability(
    label: 'liability',
    id: 2,
    sign: -1,
  );

  const BalanceType({
    required this.label,
    required this.id,
    required this.sign,
  });

  final String label;
  final int id;
  final int sign;

  bool get isAsset => this == BalanceType.asset;
  bool get isLiability => this == BalanceType.liability;
}
