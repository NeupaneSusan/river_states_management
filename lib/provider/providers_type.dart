import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_states_management/business.dart';
import 'package:riverpod_states_management/model/product_model.dart';
import 'package:riverpod_states_management/productpage.dart';
import 'package:riverpod_states_management/profilepage.dart';
import 'package:riverpod_states_management/provider.dart';

final providerName = Provider<String>((ref) => 'Susan');
final bottomBavitemProvider = Provider<List<BottomNavigationBarItem>>((ref) => [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Provider',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'StateProvider',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Product')
    ]);

final pageListProvider = Provider<List<Widget>>((ref) => [
      const ProviderType(),
      const StatesProvider(),
      const ProfilePage(),
      const ProductPage()
    ]);

final listProductProvider = Provider<List<Product>>(
    (ref) => [...productList.map((e) => Product.fromJson(e)).toList()]);
