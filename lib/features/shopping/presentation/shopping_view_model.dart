import 'package:flutter/material.dart';
import 'package:testech/features/shopping/domain/repositrories/shopping_state_repository.dart';
import 'package:testech/features/shopping/domain/shopping_state.dart';

class ShoppingViewModel extends ChangeNotifier {
  final ShoppingStateRepository _repo;
  ShoppingState _state = ShoppingState.initial();

  Future<void> _init() async {
    _state = await _repo.load();
    notifyListeners();
  }

  ShoppingViewModel(this._repo) {
    _init();
  }

  List<String> get products => List.unmodifiable(_state.products);


  Future<void> addProduct(String newProduct) async {
    _state = _state.copyWith(products: [..._state.products, newProduct]);
    await _repo.save(_state);
    notifyListeners();
  } 

  Future<void> remove(int index) async {
    List<String> newList =  [..._state.products];
    newList.removeAt(index);

    _state = _state.copyWith(products:  newList);
    await _repo.save(_state);
    notifyListeners();
  }

  Future<void> clear() async {
    _state = ShoppingState.initial();
    await _repo.save(_state);
    notifyListeners();
  }

}