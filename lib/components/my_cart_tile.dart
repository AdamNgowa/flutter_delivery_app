import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  //name and price
                  Column(
                    children: [
                      Text(cartItem.food.name),
                      Text("\$${cartItem.food.price.toString()}"),
                    ],
                  ),
                  Spacer(),
                  //increment and decrement quantity
                  MyQuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food,
                        cartItem.selectedAddons,
                      );
                    },
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                  ),
                ],
              ),
              //addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons
                      .map(
                        (addon) => Padding(
                          padding: EdgeInsetsGeometry.only(right: 10),
                          child: FilterChip(
                            label: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //addon name
                                Text(addon.name),
                                //addon price
                                Text(
                                  "\$${addon.price.toString()}",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            onSelected: (value) {},
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            labelStyle: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.inversePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
