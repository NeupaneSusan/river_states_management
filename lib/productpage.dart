import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/provider/cart_provider.dart';

import 'package:riverpod_states_management/provider/providers_type.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void showDialogBox(context, String image, String tag) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierLabel: " ",
        pageBuilder: (BuildContext context, _, __) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: tag,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final listProduct = ref.read(listProductProvider);
        return ListView.builder(
          itemCount: listProduct.length,
          itemBuilder: (context, i) {
            final tag = 'preview${listProduct[i].id}';
            return SizedBox(
              height: 150,
              child: Card(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialogBox(context, listProduct[i].image, tag);
                      },
                      child: Hero(
                        tag: tag,
                        child: Image.network(
                          errorBuilder: (context, _, __) {
                            return const Icon(Icons.error_sharp);
                          },
                          listProduct[i].image,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listProduct[i].productName,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rs ${listProduct[i].price}',
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(cardProvider.notifier).addItem(listProduct[i]);
                      },
                      child: const Icon(
                        Icons.shopping_bag,
                        size: 40,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
