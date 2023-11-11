import 'package:flutter/material.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';

import './home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishListButtonClickedEvent({required this.clickedProduct});
}


class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}



class HomeWishListNavigateClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
