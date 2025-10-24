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
    final theme = Theme.of(context);

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🖼 Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // 📋 Food name & price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Make name wrap if too long
                      Text(
                        cartItem.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: theme.colorScheme.inversePrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${cartItem.food.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // 🔢 Quantity selector (fixed width to avoid overflow)
                Flexible(
                  flex: 0,
                  child: MyQuantitySelector(
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
                ),
              ],
            ),

            // 🧩 Add-ons
            if (cartItem.selectedAddons.isNotEmpty) ...[
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: cartItem.selectedAddons.length,
                  itemBuilder: (context, index) {
                    final addon = cartItem.selectedAddons[index];
                    return FilterChip(
                      label: Text(
                        "${addon.name} (\$${addon.price.toStringAsFixed(2)})",
                        style: TextStyle(
                          color: theme.colorScheme.inversePrimary,
                          fontSize: 12,
                        ),
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(color: theme.colorScheme.primary),
                      ),
                      onSelected: (_) {},
                      backgroundColor: theme.colorScheme.secondary,
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
