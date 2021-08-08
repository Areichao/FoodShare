import 'package:flutter/material.dart';

class RestaurantForm extends StatefulWidget {

  RestaurantFormScreenState createState() => RestaurantFormScreenState();
}

class RestaurantFormScreenState extends State<RestaurantForm>{
    late String _dishName;
    late String _description;
    late String _amount;
    late String _image;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Share Form")),
      body: Container(
        margin: EdgeInsets.all(24),
      ),
    );
  }
}