import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/model/product_model.dart';

class CartProvider extends StateNotifier<List<Product>> {
  CartProvider() : super([]);
  void addItem(Product p) {
    int index = state.indexWhere((element) => element.id == p.id);

    if (index == -1) {
      p.qty = 1;
      state = [...state, p];
    } else {
      addByone(
        index,
      );
    }
  }

  void addByone(int index) {
    int qty = state[index].qty ?? 0;
    state[index].qty = qty + 1;
    state = [...state];
  }

  void removeItem(int index) {
    int qty = state[index].qty ?? 0;

    if (qty - 1 == 0) {
      state.removeAt(index);
      state = [...state];
    } else {
      state[index].qty = qty - 1;
      state = [...state];
    }
  }
}

final cardProvider =
    StateNotifierProvider<CartProvider, List<Product>>((ref) => CartProvider());

String getTotalPrice(List<Product> state) {
  double total = 0;
  for (var element in state) {
    total += element.price * (element.qty ?? 0);
  }
  return total.toStringAsFixed(2);
}
