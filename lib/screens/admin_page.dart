import 'dart:convert';

import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var formKey = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  int price = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  name = val ?? "";
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  desc = val ?? "";
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  price = int.parse(val ?? '0');
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  quantity = int.parse(val ?? '0');
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Quantity',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                formKey.currentState!.save();
                var medicine = DrugsModel(
                  id: 0,
                  name: name,
                  description: desc,
                  price: price,
                  imageUrl:
                      'https://cdn.eapteka.ru/upload/offer_photo/239/22/1_2931654b9a48a650c6cfdc55e0b078dc.png?t=1633092856&_cvc=1666017915',
                  quantity: quantity,
                );
                postMedicine(medicine);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  void postMedicine(DrugsModel medicine) async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    var response = await http.post(Uri.parse(url),
        body: jsonEncode(medicine.toJson()), headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Info'),
              content: Text(response.body.toString()),
            );
          });
    }
  }

  
}