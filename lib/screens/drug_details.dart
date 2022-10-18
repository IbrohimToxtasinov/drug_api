import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DrugInfo extends StatefulWidget {

  DrugsModel getResult;

  DrugInfo({super.key, required this.getResult});

  @override
  State<DrugInfo> createState() => _DrugInfoState();
}
class _DrugInfoState extends State<DrugInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Image.network(widget.getResult.imageUrl ?? "", width: 200, height: 200,),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.getResult.name ?? "", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    Text("${widget.getResult.quantity}gr", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text(widget.getResult.description ?? "", style: const TextStyle(fontSize: 14,),),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("${widget.getResult.price} so'm", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}