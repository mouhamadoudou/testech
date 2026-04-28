import 'package:flutter/foundation.dart';
import 'package:testech/features/counter/domain/counter_state.dart';
import 'package:testech/features/counter/domain/repositories/counter_repository.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterRepository _repository;
  CounterState _state = const CounterState.initial();

  Future<void> _init () async {
    _state = await _repository.load();
    notifyListeners();
  }

  CounterViewModel(this._repository) {
    _init();
  }

  int get count => _state.count;
  List<int> get history => List.unmodifiable(_state.history);

  Future<void> increment() async {
    try {
      _state = _state.copyWith(
        count: _state.count + 1,
        history: [..._state.history, _state.count + 1],
      );
      await _repository.save(_state);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> decrement() async {
    try {
      _state = _state.copyWith(
        count: _state.count - 1,
        history: [..._state.history, _state.count - 1],
      );
      await _repository.save(_state);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> reset() async {
    try {
      _state = _state.copyWith(count: 0, history: []);
      await _repository.save(_state);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
