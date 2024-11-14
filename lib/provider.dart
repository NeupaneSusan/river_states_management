import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/provider/providers_type.dart';

class ProviderType extends StatelessWidget {
  const ProviderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type of Provider in riverpod'),
        Text('1) Provider'),
        Text('2) States Provider'),
        Consumer(builder: (context, ref, child) {
          final name = ref.watch(providerName);
          return Text(name);
        }),
      ],
    );
  }
}

//we can get value from two type;

//Consumer

//consumerWidget

