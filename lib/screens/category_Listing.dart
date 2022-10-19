import 'dart:convert';

import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:drugs_app/screens/drug_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DrugsPage extends StatefulWidget {
  const DrugsPage({Key? key}) : super(key: key);

  @override
  State<DrugsPage> createState() => _DrugsPageState();
}

class _DrugsPageState extends State<DrugsPage> {
  Future<List<DrugsModel>?>? getResult;

  Future<List<DrugsModel>> getData() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body) as List;
      List<DrugsModel> users = json.map((e) => DrugsModel.fromJson(e)).toList();
      return users;
    }

    return List.empty();
  }

  @override
  void initState() {
    super.initState();

    getResult = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFCBCBCB),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFCBCBCB),
        title: const Text("All Drugs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back_sharp,)),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.search,),
          ),
          SizedBox(width: 12,),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<DrugsModel>?>(
          future: getResult,
          builder:
              (BuildContext context, AsyncSnapshot<List<DrugsModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<DrugsModel?>? users = snapshot.data;
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.98,
                        ),
                        itemCount: users?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return buldButton(users , index);
                        }
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
  Widget buldButton(users, index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DrugInfo(medicineId: users[index].id,)));
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(  
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(users?[index]?.imageUrl ?? "", width: 100, height: 100,),
              const SizedBox(height: 10,),
              Text(users?[index]?.name ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${users?[index]?.price ?? 0} so'm", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                  const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}