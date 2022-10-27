import 'dart:convert';

import 'package:drugs_app/datas/shared_preferens.dart';
import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:drugs_app/screens/admin_page.dart';
import 'package:drugs_app/screens/drug_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<DrugsModel>> getMedicineList() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      List<DrugsModel> medicines = json.map((e) => DrugsModel.fromJson(e)).toList();
      return medicines;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    String name = StorageRepository.getString("name");
    return Scaffold(
      backgroundColor:const Color(0xFFCBCBCB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xFFCBCBCB),
        title: Text("Hi $name"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            getMedicineList();
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder<List<DrugsModel>>(
            future: getMedicineList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<DrugsModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return myGrid(snapshot.data!);
              }
              return const Center(
                child: Text("nimadir ishkal"),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AdminPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget myGrid(List<DrugsModel> medicineList) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: medicineList.length,
      itemBuilder: (context, index) {
        return Dismissible(
            behavior: HitTestBehavior.deferToChild,
            key: Key(index.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: const Center(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                showDeleteDialog(medicineList[index].id);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: medicineItem(medicineList, index),
            ));
      },
    );
  }

  Widget medicineItem(users, index) {
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

  void showDeleteDialog(num? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete ??"),
            content: const Text("Rostdan ham o'chirmoqchimisiz ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    callDelete(id);
                  },
                  child: const Text("Yes")),
            ],
          );
        });
  }

  void callDelete(num? id) async {
    String url =
        "https://pharmacy-app-management.herokuapp.com/api/drugs/${id}";

    var response = await http.delete(Uri.parse(url));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('SUCCESS'),
              content: Text(response.body.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('ERROR'),
              content: Text(response.body.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }
}