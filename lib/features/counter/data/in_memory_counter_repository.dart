import 'package:testech/features/counter/domain/counter_state.dart';
import 'package:testech/features/counter/domain/repositories/counter_repository.dart';

class InMemoryCounterRepository implements CounterRepository {
  CounterState _state = const CounterState.initial();

  @override
  Future<void> save(CounterState state) async {
    _state = state;
  }

  @override
  Future<CounterState> load() async => _state;
}
