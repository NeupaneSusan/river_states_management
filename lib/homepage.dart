import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/cartpage.dart';
import 'package:riverpod_states_management/provider/cart_provider.dart';
import 'package:riverpod_states_management/provider/providers_type.dart';
import 'package:riverpod_states_management/provider/states_provider.dart';

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.watch(providerMenu);
    final cart = ref.watch(cardProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text(title),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const CartPage()));
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(),
                const Positioned(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
                Visibility(
                  visible: cart.isEmpty ? false : true,
                  child: Positioned(
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      constraints:
                          const BoxConstraints(minWidth: 20, minHeight: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text("${cart.length}"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: ref.read(pageListProvider).elementAt(menuProvider),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 12,
          type: BottomNavigationBarType.fixed,
          currentIndex: menuProvider,
          onTap: (value) {
            final index = ref.read(providerMenu.notifier);
            index.state = value;
          },
          items: ref.read(bottomBavitemProvider)),
    );
  }
}
