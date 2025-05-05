import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({required this.id, required this.title, required this.image, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
    );
  }
}

class CartItemSample extends StatefulWidget {
  @override
  _CartItemSampleState createState() => _CartItemSampleState();
}

class _CartItemSampleState extends State<CartItemSample> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchCartProducts();
  }

  Future<void> fetchCartProducts() async {
    for (int i = 1; i <= 3; i++) {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/products/$i'));
      if (response.statusCode == 200) {
        setState(() {
          products.add(Product.fromJson(json.decode(response.body)));
        });
      } else {
        print('Failed to load product $i');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Radio(
              value: product.id.toString(),
              groupValue: "",
              activeColor: Color(0xFFF06292),
              onChanged: (value) {},
            ),
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(right: 15),
              child: Image.network(product.image),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF06292),
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF06292),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.minus),
                        onPressed: () {},
                      ),
                      Text(
                        "01",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF06292),
                        ),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.plus),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        );
      }).toList(),
    );
  }
}





/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({required this.id, required this.title, required this.image, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
    );
  }
}


class CartItemSample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        for (int i=1; i<4; i++)
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Radio(
                value: "",
                groupValue: "",
                activeColor: Color(0xFFF06292),
                onChanged: (index){},
              ),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("images/$i.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Title",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF06292),
                      ),
                    ),
                    Text(
                      "\$55",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF06292),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10
                              ),
                            ]
                          ),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "01",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF06292),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10
                                ),
                              ]
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],),
          ),
      ],
    );
  }
} */