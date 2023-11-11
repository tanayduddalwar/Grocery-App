import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_store/features/cart/bloc/cart_bloc.dart';
import 'package:groccery_store/features/cart/bloc/cart_event.dart';
import 'package:groccery_store/features/cart/bloc/cart_state.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';

import 'package:groccery_store/features/home/UI/product_tile_widget.dart';
import './cart_tile.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => !(current is CartActionState),
        listener: (context, state) {
          // Update the UI based on the state change.
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartBloc,
                    productDataModel: successState.cartItems[index],
                  );
                },
              );
            default:
              return Container(); // You can return an empty container or a loading indicator here.
          }
        },
      ),
    );
  }
}
