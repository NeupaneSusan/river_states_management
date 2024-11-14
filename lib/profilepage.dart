import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/provider/state_notifier_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void changeName(WidgetRef ref, String name) {
    ref.read(userNotifier.notifier).changeName(name);
  }

  void changelastName(WidgetRef ref, String name) {
    ref.read(userNotifier.notifier).changeLastName(name);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      String name = ref.watch(userNotifier).name ?? '';
      String lastname = ref.watch(userNotifier).lastName ?? '';
      return Column(
        children: [
          TextFormField(
            onChanged: (value) => changeName(ref, value),
          ),
          TextFormField(
            onChanged: (value) => changelastName(ref, value),
          ),
          Text("firstName:$name "),
          Text("lastName:$lastname"),
        ],
      );
    });
  }
}
