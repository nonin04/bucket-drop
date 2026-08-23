enum DropType {
  income('収入'),
  expense('支出'),
  transfer('振替');

  final String label;
  const DropType(this.label);
}
