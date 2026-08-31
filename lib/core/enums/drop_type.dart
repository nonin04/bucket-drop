enum DropType {
  income(
    label: '収入',
    id: 1,
  ),
  expense(
    label: '支出',
    id: 2,
  ),
  transfer(
    label: '振替',
    id: 3,
  );

  const DropType({
    required this.label,
    required this.id,
  });

  final String label;
  final int id;

  bool get isIncome => this == DropType.income;
  bool get isExpense => this == DropType.expense;
  bool get isTransfer => this == DropType.transfer;
}
