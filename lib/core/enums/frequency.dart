// dart format off
enum Frequency {
  dayly(
    label: '日次',
    id: 1,
  ),
  weekly(
    label: '週次',
    id: 2,
  ),
  monthly(
    label: '月次',
    id: 3,
  ),
  yearly(
    label: '年次',
    id: 4,
  );

  const Frequency({
    required this.label,
    required this.id,
  });

  final String label;
  final int id;

  bool get isDayly => this == Frequency.dayly;
  bool get isWeekly => this == Frequency.weekly;
  bool get isMonthly => this == Frequency.monthly;
  bool get isYearly => this == Frequency.yearly;
}
