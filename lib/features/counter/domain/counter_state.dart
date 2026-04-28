class CounterState {
  final int count;
  final List<int> history;

  const CounterState({required this.count, required this.history});
  const CounterState.initial() : count = 0, history = const [];

  CounterState copyWith({int? count, List<int>? history}) {
    return CounterState(
      count: count ?? this.count,
      history: history ?? this.history,
    );
  }
}
