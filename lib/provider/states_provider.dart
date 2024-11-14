import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerMenu = StateProvider<int>((ref) => 0);

final textChangeProvider = StateProvider<String?>((ref) => null);
