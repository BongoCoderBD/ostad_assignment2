import 'package:flutter/material.dart';

import '../widget/shoping_card_item.dart';
import '../widget/style.dart';

class ShoppingCart extends StatelessWidget {
  final List<Map<String, dynamic>> itemList = [
    {
      "name": "Pullover",
      "color": "Black",
      "size": "L",
      "image": "asset/images/card1.png"
    },
    {
      "name": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "image": "asset/images/card2.png"
    },
    {
      "name": "Sport Dress",
      "color": "Black",
      "size": "M",
      "image": "asset/images/card3.png"
    }
  ];

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),

        ],
      ),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Bag',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  itemName: itemList[index]["name"],
                  itemImage: itemList[index]["image"],
                  itemColor: itemList[index]["color"],
                  itemSize: itemList[index]["size"],
                );
              },
            ),
          ),
         const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$19',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  MySnackBar("Congratulations! Checkout successful.",context);
                },
                style: AppButtonStyle(),
                child: const Text("CHECK OUT", style:  TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
        ],
      ),

    );
  }
}



