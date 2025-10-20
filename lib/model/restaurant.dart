import 'package:food_delivery_app/model/food.dart';

class Restaurant {
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
      availableAddon: [
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
      availableAddon: [
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
      availableAddon: [
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
      availableAddon: [
        Addon(name: "Soda", price: 1.00),
        Addon(name: "Extra Fries", price: 1.00),
      ],
    ),
    //salads
    Food(
      name: "Crunchy Chicken Salad",
      description:
          "Something light on the tummy but super packed with great nutrients. Come enjoy a bowl of Crunchy Chicken Salad with special sauce!",
      imagePath: "lib/images/burgers/crunchy_chiken_salad.png",
      price: 8.00,
      category: FoodCategory.salads,
      availableAddon: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "Delight Salad",
      description:
          "Something light on the tummy but super packed with great nutrients. Come enjoy a bowl of Delight Salad with special sauce!",
      imagePath: "lib/images/burgers/delight_salad.png",
      price: 8.00,
      category: FoodCategory.salads,
      availableAddon: [Addon(name: "Water", price: 1.00)],
    ),
    //sides
    Food(
      name: "Chilli Cheese Bites",
      description:
          "Crispy coat with smooth and spicy cheese inside. Unique taste of chilli with every bite. You will love our Chilli Cheese Bites!",
      imagePath: "lib/images/burgers/king_onion_rings.png",
      price: 3.20,
      category: FoodCategory.sides,
      availableAddon: [Addon(name: "Water", price: 1.00)],
    ),
    //desserts
    Food(
      name: "Chocolate Donut",
      description:
          "Our soft and tender Chocolate Donut treats your taste buds to a roller coaster of creamy and chocolatey fun, yum!",
      imagePath: "lib/images/burgers/chocolate-donut.png",
      price: 2.00,
      category: FoodCategory.desserts,
      availableAddon: [Addon(name: "Water", price: 1.00)],
    ),
    Food(
      name: "King Fusion",
      description:
          "The BK Fusion with Oreo® combines our delicious, smooth vanilla ice cream with crunchy bits of Oreo® cookies",
      imagePath: "lib/images/burgers/desserts_kitkat_oreo.png",
      price: 4.00,
      category: FoodCategory.desserts,
      availableAddon: [Addon(name: "Water", price: 1.00)],
    ),

    //drinks
    Food(
      name: "Milkshakes",
      description:
          "There's only one problem, which flavour do you choose? Vanilla? Chocolate? Strawberry? This could take some time.",
      imagePath: "lib/images/burgers/milkshakes.png",
      price: 4.00,
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Sodas",
      description: "Quench your thirst with a soft drink.",
      imagePath: "lib/images/burgers/sodas.png",
      price: 1.50,
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Water",
      description: "Keep refreshed with every sip.",
      imagePath: "lib/images/burgers/water.png",
      price: 1.00,
      category: FoodCategory.drinks,
    ),
  ];
  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  /*
  O P E R A T I O N S
  */
  //add to cart
  //remove from cart
  //get total  price
  //get total number of items of items in cart
  //clear cart
  /*
  H E L P E R S
  */
  //generate a receipt
  //format double value into money
  //format list of addons into a string summary
}
