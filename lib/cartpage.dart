import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final listProduct = ref.watch(cardProvider);
        return listProduct.isEmpty
            ? const Center(
                child: Text(
                'No Item On Cart.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: listProduct.length,
                      itemBuilder: (contex, i) {
                        return SizedBox(
                          height: 150,
                          child: Dismissible(
                            key: Key('key$i'),
                            background: Container(
                              color: Colors.red,
                            ),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15.0)),
                                    child: Image.network(
                                      errorBuilder: (context, _, __) {
                                        return const Icon(Icons.error_sharp);
                                      },
                                      listProduct[i].image,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          listProduct[i].productName,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Rs ${listProduct[i].price}',
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55,
                                    decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            bottomRight:
                                                Radius.circular(15.0))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            ref
                                                .read(cardProvider.notifier)
                                                .addItem(listProduct[i]);
                                          },
                                          child: Material(
                                            elevation: 2,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${listProduct[i].qty}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ref
                                                .read(cardProvider.notifier)
                                                .removeItem(i);
                                          },
                                          child: Material(
                                            elevation: 2,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sub Total Price',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Shipping Charge',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  getTotalPrice(listProduct),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  '0.00',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Grand Total Price',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Rs ${getTotalPrice(listProduct)}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
      }),
    );
  }
}
