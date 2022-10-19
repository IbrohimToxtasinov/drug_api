import 'dart:convert';
import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:drugs_app/models/drugs/korzinka_model.dart';
import 'package:drugs_app/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DrugInfo extends StatefulWidget {

  num medicineId;

  DrugInfo({super.key, required this.medicineId});

  @override
  State<DrugInfo> createState() => _DrugInfoState();
}
class _DrugInfoState extends State<DrugInfo> {

  Future<DrugsModel?> getData() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs/${widget.medicineId}";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as Map<String,dynamic>;
      return DrugsModel.fromJson(jsonData);
    }
    return null; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); 
          }
          if(snapshot.hasData){
            DrugsModel medicine = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Image.network(medicine.imageUrl ?? "", width: 200, height: 200,),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(medicine.name ?? "", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        Text("${medicine.quantity}gr", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(medicine.description ?? "", style: const TextStyle(fontSize: 14,),),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage(medicineid: medicine.id)));
                      sets.add(DrugsModel(id: medicine.id, name: medicine.name, description: medicine.description, imageUrl: medicine.imageUrl, price: medicine.price, quantity: medicine.quantity));
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text("${medicine.price} so'm", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}
