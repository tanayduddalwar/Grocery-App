import 'package:flutter/cupertino.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';

import './home_bloc.dart';

@immutable
abstract class Homestate {}

abstract class HomeActionState extends Homestate {}

class Homeinitial extends Homestate {}

class HomeLoadingState extends Homestate {}

class HomeLoadedSuccessState extends Homestate {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends Homestate {}

class HomeNavigatetoWishlistpageactionState extends HomeActionState {}

class HomeNavigatetoCartpageactionState extends HomeActionState {}
class HomeProductItemWishlistActionState extends HomeActionState{}
class HomeProductItemCartlistActionState extends HomeActionState{}
