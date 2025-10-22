import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/food.dart';

class Restaurant extends ChangeNotifier {
  //List of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Whopper",
      description:
          "Our WHOPPER Sandwich is a ¼ lb* of savory flame-grilled beef topped with juicy tomatoes, freshly cut lettuce, creamy mayonnaise, crunchy pickles and sliced white onions on a soft sesame seed bun.",
      imagePath: "lib/images/burgers/whopper.png",
      price: 9.80,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Soda", price: 1.00),
        Addon(name: "Extra Fries", price: 1.00),
      ],
    ),
    Food(
      name: "Rebel Whopper",
      description: "Best veggie burger out there.",
      imagePath: "lib/images/burgers/rebel_whopper.png",
      price: 10.70,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Soda", price: 1.00),
        Addon(name: "Extra Fries", price: 1.00),
      ],
    ),
    Food(
      name: "Whopper Jr",
      description:
          "ur WHOPPER JR. Sandwich features one savory flame-grilled beef patty topped with juicy tomato, freshly cut lettuce, creamy mayonnaise, crunchy pickles and sliced white onions on a soft sesame seed bun.",
      imagePath: "lib/images/burgers/whopper_jr.png",
      price: 7.40,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Soda", price: 1.00),
        Addon(name: "Extra Fries", price: 1.00),
      ],
    ),
    Food(
      name: "Double Cheese Bacon",
      description:
          "Our WHOPPER Sandwich is a ¼ lb* of savory flame-grilled beef topped with juicy tomatoes, freshly cut lettuce, creamy mayonnaise, crunchy pickles and sliced white onions on a soft sesame seed bun.",
      imagePath: "lib/images/burgers/double_cheese_bacon.png",
      price: 9.80,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Soda", price: 1.00),
        Addon(name: "Extra Fries", price: 1.00),
      ],
    ),
    //salads
    Food(
      name: "Crunchy Chicken Salad",
      description:
          "Something light on the tummy but super packed with great nutrients. Come enjoy a bowl of Crunchy Chicken Salad with special sauce!",
      imagePath: "lib/images/salads/crunchy_chicken_salad.png",
      price: 8.00,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "Delight Salad",
      description:
          "Something light on the tummy but super packed with great nutrients. Come enjoy a bowl of Delight Salad with special sauce!",
      imagePath: "lib/images/salads/delight_salad.png",
      price: 8.00,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    //sides
    Food(
      name: "Chilli Cheese Bites",
      description:
          "Crispy coat with smooth and spicy cheese inside. Unique taste of chilli with every bite. You will love our Chilli Cheese Bites!",
      imagePath: "lib/images/sides/king_onion_rings.png",
      price: 3.20,
      category: FoodCategory.sides,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    //desserts
    Food(
      name: "Chocolate Donut",
      description:
          "Our soft and tender Chocolate Donut treats your taste buds to a roller coaster of creamy and chocolatey fun, yum!",
      imagePath: "lib/images/desserts/chocolate-donut.png",
      price: 2.00,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "King Fusion",
      description:
          "The BK Fusion with Oreo® combines our delicious, smooth vanilla ice cream with crunchy bits of Oreo® cookies",
      imagePath: "lib/images/desserts/desserts_kitkat_oreo.png",
      price: 4.00,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),

    //drinks
    Food(
      name: "Milkshakes",
      description:
          "There's only one problem, which flavour do you choose? Vanilla? Chocolate? Strawberry? This could take some time.",
      imagePath: "lib/images/drinks/milkshakes.png",
      price: 4.00,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "Sodas",
      description: "Quench your thirst with a soft drink.",
      imagePath: "lib/images/drinks/sodas.png",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "Water",
      description: "Keep refreshed with every sip.",
      imagePath: "lib/images/drinks/water.png",
      price: 1.00,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Water", price: 1.00)],
    ),
  ];
  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  /*
  O P E R A T I O N S
  */
  //user cart
  final List<CartItem> _cart = [];
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //first we see if there is a cart item with the selected food items
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the field items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });
    //if the item already exists ,we increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise we will add a new cart item
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total  price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  H E L P E R S
  */
  //generate a receipt
  //format double value into money
  //format list of addons into a string summary
}
