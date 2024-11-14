import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/provider/states_provider.dart';

class StatesProvider extends ConsumerWidget {
  const StatesProvider({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            ref.read(textChangeProvider.notifier).update((state) {
              return value.isEmpty ? null : value;
            });
          },
        ),
        Text(ref.watch(textChangeProvider) ?? 'initial states')
      ],
    );
  }
}
