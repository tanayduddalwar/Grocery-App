import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:groccery_store/data/cart_items.dart';
import 'package:groccery_store/data/data.dart';
import 'package:groccery_store/data/wishlist_items.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';
import './home_event.dart';
import './home_state.dart';

class HomeBloc extends Bloc<HomeEvent, Homestate> {
  HomeBloc() : super(Homeinitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(_homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonClickedEvent>(
        _homeProductWishlistButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(_homeCartButtonNavigateEvent);
    on<HomeWishListNavigateClickedEvent>(_homeWishListNavigateClickedEvent);
  }

  FutureOr<void> _homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<Homestate> emit) {
    print("Cart product clicked");
    cartItems.add(event.clickedProduct);
  }

  FutureOr<void> _homeProductWishlistButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<Homestate> emit) {
    print("Wishlist product Clicked");
    Wishlistitems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
  }

  FutureOr<void> _homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<Homestate> emit) {
    print("Cart button clicked");
    emit(HomeNavigatetoCartpageactionState());
  }

  FutureOr<void> _homeWishListNavigateClickedEvent(
      HomeWishListNavigateClickedEvent event, Emitter<Homestate> emit) {
    print("Wishlist button clicked");
    emit(HomeNavigatetoWishlistpageactionState());
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<Homestate> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: Groccery.groceryList
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
}
