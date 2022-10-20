import 'dart:convert';
import 'dart:ui';

import 'package:drugs_app/models/drugs/drugs_model.dart';
import 'package:drugs_app/models/drugs/korzinka_model.dart';
import 'package:drugs_app/screens/Success.dart';
import 'package:drugs_app/utils/colors.dart';
import 'package:drugs_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  final int? medicineid;
  const CartPage({super.key, required this.medicineid});

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {

  Future<DrugsModel?> getData() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs/${widget.medicineid}";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as Map<String,dynamic>;
      return DrugsModel.fromJson(jsonData);
    }
    return null; 
  }
  int scht = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Your cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: () {

          },
          child: const Icon(Icons.arrow_back_sharp, size: 30,),
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            DrugsModel medicine = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text("2 Items in your cart", style: TextStyle(fontSize: 16, color: MyColors.c_090F47.withOpacity(0.45)),)),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        children: const [
                          Icon(Icons.add, size: 20, color: MyColors.c_4157FF,),
                          Text("Add more", style: TextStyle(fontSize: 16, color: MyColors.c_4157FF),),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(medicine.imageUrl ?? "", width: 100, height: 100,),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(medicine.name ?? "", style: const TextStyle(fontWeight: FontWeight.w600),),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          child: const Icon(Icons.clear_rounded, size: 20,),
                                        ),
                                      ],
                                    ),
                                    Text("bottle of ${medicine.quantity ?? 0} pellets", style: const TextStyle(fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${medicine.price ?? 0} so'm", style: const TextStyle(fontWeight: FontWeight.w600),),
                                        Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      scht++;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue.withOpacity(0.3),
                                                    ),
                                                    child: const Icon(Icons.add_circle_outline_sharp, size: 30,),
                                                  ),
                                                ),
                                                const SizedBox(width: 5,),
                                                Text("$scht", style: const TextStyle(fontWeight: FontWeight.w700),),
                                                const SizedBox(width: 5,),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      scht--;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue.withOpacity(0.3),
                                                    ),
                                                    child: const Icon(Icons.remove_circle_outline_sharp, size: 30,),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(medicine.imageUrl ?? "", width: 100, height: 100,),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(medicine.name ?? "", style: const TextStyle(fontWeight: FontWeight.w600),),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          child: const Icon(Icons.clear_rounded, size: 20,),
                                        ),
                                      ],
                                    ),
                                    Text("bottle of ${medicine.quantity ?? 0} pellets", style: const TextStyle(fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${medicine.price ?? 0} so'm", style: const TextStyle(fontWeight: FontWeight.w600),),
                                        Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      scht++;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue.withOpacity(0.3),
                                                    ),
                                                    child: const Icon(Icons.add_circle_outline_sharp, size: 30,),
                                                  ),
                                                ),
                                                const SizedBox(width: 5,),
                                                Text("$scht", style: const TextStyle(fontWeight: FontWeight.w700),),
                                                const SizedBox(width: 5,),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      scht--;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue.withOpacity(0.3),
                                                    ),
                                                    child: const Icon(Icons.remove_circle_outline_sharp, size: 30,),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 18),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(MyImages.iconPurcheis, width: 25, height: 25,),
                            const SizedBox(width: 16,),
                            const Text("1 Coupon applied", style: TextStyle(color: MyColors.c_27AE60, fontSize: 16, fontWeight: FontWeight.w500),)
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: const Icon(Icons.clear_rounded, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text("Payment Summary", style:  TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 29),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47.withOpacity(0.45))),
                          const Text("\$228.80", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47)),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Items Discount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47.withOpacity(0.45))),
                          const Text("- \$28.80", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47)),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Coupon Discount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47.withOpacity(0.45))),
                          const Text("-\$15.80", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47)),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47.withOpacity(0.45))),
                          const Text("Free", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(color: MyColors.c_000000.withOpacity(0.5),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.c_090F47.withOpacity(0.45))),
                          Text("${(medicine.price ?? 0) * scht} so'm", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: MyColors.c_090F47.withOpacity(0.45))),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessPage()));
                  },
                  child: Center(
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: MyColors.c_4157FF,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Center(child: Text("Place Order @ ${(medicine.price ?? 0) * scht} so'm", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: MyColors.c_FFFFFF),))
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}