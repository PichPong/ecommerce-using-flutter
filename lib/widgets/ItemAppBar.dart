import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemAppBar extends StatefulWidget {
  final int productId;

  const ItemAppBar({Key? key, required this.productId}) : super(key: key);

  @override
  _ItemAppBarState createState() => _ItemAppBarState();
}

class _ItemAppBarState extends State<ItemAppBar> {
  String productTitle = "Loading...";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProductTitle();
  }

  Future<void> fetchProductTitle() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/products/${widget.productId}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          productTitle = data['title'] ?? 'No Title';
          isLoading = false;
        });
      } else {
        setState(() {
          productTitle = 'Error loading title';
        });
      }
    } catch (e) {
      setState(() {
        productTitle = 'Connection error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFFF06292),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                productTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Color(0xFFF06292),
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}











/* import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFFF06292),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Color(0xFFF06292),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
        ],
      ),
    );
  }
} */