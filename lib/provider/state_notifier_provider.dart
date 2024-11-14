import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/model/user_model.dart';

final userNotifier =
    StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(UserModel(name: null, lastName: null));
  void changeName(String name) {
    state = state.copyWith(name: name);
  }

  void changeLastName(String lastname) {
    state = state.copyWith(lastName: lastname);
  }
}
