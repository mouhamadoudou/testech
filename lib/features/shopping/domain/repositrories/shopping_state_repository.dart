import 'package:testech/features/shopping/domain/shopping_state.dart';

abstract class ShoppingStateRepository {
  Future<void> save(ShoppingState state);
  Future<ShoppingState> load();
}