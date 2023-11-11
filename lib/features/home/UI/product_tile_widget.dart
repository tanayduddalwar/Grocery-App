import 'package:flutter/material.dart';
import 'package:groccery_store/features/home/bloc/home_event.dart';
import 'package:groccery_store/features/home/models/home_product_data_model.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {Key? key, required this.productDataModel, required this.homeBloc})
      : super(key: key);

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.productDataModel.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + widget.productDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
IconButton(
  onPressed: () {
    widget.homeBloc.add(
      HomeProductWishListButtonClickedEvent(
        clickedProduct: widget.productDataModel,
      ),
    );
  },
  icon: Icon(Icons.favorite_border_outlined),
),

             IconButton(
  onPressed: () {
    widget.homeBloc.add(
      HomeProductCartButtonClickedEvent(
        clickedProduct: widget.productDataModel,
      ),
    );
  },
  icon: Icon(Icons.shopping_bag_outlined),
),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
