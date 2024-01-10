import 'package:flutter/material.dart';

import 'style.dart';

class ShoppingCartItem extends StatefulWidget {
  final String? itemName;
  final String? itemImage;
  final String? itemColor;
  final String? itemSize;

  const ShoppingCartItem(
      {Key? key, this.itemName, this.itemImage, this.itemColor, this.itemSize})
      : super(key: key);

  @override
  ShoppingCartItemState createState() => ShoppingCartItemState();
}

class ShoppingCartItemState extends State<ShoppingCartItem> {
  int itemCount = 1;
  double unitPrice = 19.99; // Replace with actual unit price
  double totalAmount = 19.99 * 1; // Initial total amount




  void updateTotalAmount() {
    setState(() {
      totalAmount = unitPrice * itemCount;
    });
  }

  void showAddToBagDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Congratulations!",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Center align the title text
            ),
          ),
          content:  Text("You have added \n $itemCount \n ${widget.itemName ?? ""} on your bag!",
              style:const TextStyle(color: Colors.black, fontSize: 20,),
              textAlign: TextAlign.center, // Center align the content text
            ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your "CHECK OUT" button logic here
                  Navigator.of(context).pop(); // Close the dialog if needed
                },
                style: AppButtonStyle(),
                child: const Text("OKAY", style:  TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ],

        );
      },
    );
  }

  void showCheckoutSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Congratulations! Your order has been placed."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: [
              // Image
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Image.asset(
                  widget.itemImage ??
                      'asset/images/default_image.jpg', // Replace with a default image path
                  fit: BoxFit.fill,
                ),
              ),
              // Column with 2 tags
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemName ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Color: ${widget.itemColor}   Size: ${widget.itemSize}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      50), // Set the border radius
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (itemCount > 1) {
                                setState(() {
                                  itemCount--;
                                  updateTotalAmount();
                                });
                              }
                            },
                          ),

                         const SizedBox(width: 10,),

                          Text(itemCount.toString()),
                         const SizedBox(width: 10,),
                          IconButton(
                            icon: const Icon(Icons.add),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      50), // Set the border radius
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                itemCount++;
                                updateTotalAmount();
                                if (itemCount == 5) {
                                  showAddToBagDialog();
                                }
                              });
                            },
                          ),

                         const SizedBox(width: 70,),
                          Text(
                            '\$${totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
