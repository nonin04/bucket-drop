enum DropType {
  income('収入'),
  expense('支出'),
  transfer('振替');

  const DropType(this.label);
  final String label;
}
