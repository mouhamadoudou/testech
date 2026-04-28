import 'package:testech/features/shopping/domain/repositrories/shopping_state_repository.dart';
import 'package:testech/features/shopping/domain/shopping_state.dart';

class InMemoryShoppingState implements ShoppingStateRepository {
  ShoppingState _state;

  InMemoryShoppingState(this._state);

  @override
  Future<ShoppingState> load() async {
    return _state;
  }

  @override
  Future<void> save(ShoppingState state) async {
    _state = state;
  } 
}