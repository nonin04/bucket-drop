enum BucketType {
  bank('銀行口座'),
  investment('証券口座'),
  cash('現金・財布'),
  point('ポイント'),
  eMoney('電子マネー');

  final String label;
  const BucketType(this.label);
}

