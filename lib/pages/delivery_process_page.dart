import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';

class DeliveryProcessPage extends StatelessWidget {
  const DeliveryProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: SafeArea(
        child: SingleChildScrollView(child: Column(children: [MyReceipt()])),
      ),
    );
  }

  //Custom Bottom Navbar
  Widget _buildBottomNavBar(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            //profile pic of driver
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ),
            SizedBox(width: 10),
            //driver details
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adam",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Driver",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                //message button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 10),
                //call button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            //call button
          ],
        ),
      ),
    );
  }
}
