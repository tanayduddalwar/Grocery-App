import 'package:flutter/cupertino.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';

import './cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}
