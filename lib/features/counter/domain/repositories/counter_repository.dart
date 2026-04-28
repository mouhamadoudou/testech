import 'package:testech/features/counter/domain/counter_state.dart';

abstract class CounterRepository {
  Future<CounterState> load();
  Future<void> save(CounterState state);
}