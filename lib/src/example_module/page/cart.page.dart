import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sneaker_app/Router/router.gr.dart';
import 'package:sneaker_app/widgets/badgeCartno.dart';
import 'package:sneaker_app/widgets/bagCard.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String? name;
  String? mobileno;
  String? pincode;
  String? address;
  String? locality;
  String? district;
  String? state;
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  String _paymentMethod = "Cash on Delivery";
  getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    mobileno = prefs.getString('mobileno');
    pincode = prefs.getString('pincode');
    address = prefs.getString('address');
    locality = prefs.getString('locality');
    district = prefs.getString('city');
    state = prefs.getString('state');
    setState(() {});
  }

  final _pageController = PageController(initialPage: 0);
  final _couponPageController = PageController(initialPage: 0);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobilenoController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locatityController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  bool isChecked = false;
  void saveAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('mobileno', mobilenoController.text);
    await prefs.setString('pincode', pinController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setString('locality', locatityController.text);
    await prefs.setString('city', cityController.text);
    await prefs.setString('state', stateController.text);
  }

  void getCheckBoxValue(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked.
      setState(() {
        isChecked = true;
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked.
      setState(() {
        isChecked = false;
      });
    }
  }

  Stream<List<Map<String, dynamic>>> streamAddtoBadShoes() {
    return FirebaseFirestore.instance
        .collection('kicks')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Map<String, dynamic>> bagshoes = [];

      for (var document in snapshot.docs) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        if (data != null &&
            data.containsKey('shoes') &&
            data['shoes'] != null) {
          List<dynamic> shoes = data['shoes'] as List<dynamic>;

          for (var shoe in shoes) {
            if (shoe is Map<String, dynamic> && shoe['add_to_bag'] == true) {
              bagshoes.add(Map<String, dynamic>.from(shoe));
            }
          }
        }
      }
      return bagshoes;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: streamAddtoBadShoes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> bagshoes = snapshot.data!;
          double totalAmount = 0.0;
          double totalMRP = 0.0;
          double totalOffer = double.parse(0.0.toStringAsFixed(2));
          List productId = [];
          for (var element in bagshoes) {
            totalMRP = totalMRP +
                double.parse(element["price"].toString()) *
                    double.parse(element["selectesQty"].toString());
            totalOffer = totalOffer +
                double.parse(element["price"].toString()) *
                    double.parse(element["offer"].toString()) *
                    double.parse(element["selectesQty"].toString()) /
                    double.parse(100.toString());
            productId.add(element["product_Id"]);
          }
          totalAmount = totalMRP - totalOffer;
          if (bagshoes.isEmpty) {
            return SafeArea(
              child: Container(
                height: 500,
                width: 500,
                color: const Color(0xfff4f4f4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(flex: 7, child: SizedBox()),
                        const Text(
                          "Shopping Bag",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const Expanded(flex: 5, child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              onPressed: () {
                                context.router.push(const WishlistRoute());
                              },
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Lottie.asset('assets/lotti/emptycart.json'),
                    const Text(
                      "Your Shopping Bag Is Empty ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Add somthing to make me happy",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                //Color(0xffff406c)
                                Colors.black),
                            side:
                                const MaterialStatePropertyAll(BorderSide.none),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          onPressed: () {
                            context.router.push(const AuthFlowpage());
                          },
                          child: const Text(
                            'Continue Shopping',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: const Color(0xfff4f4f4),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Column(
                  children: [
                    Text(
                      "Shopping Bag",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text()
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.router.push(const WishlistRoute());
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                        const BadgeCartno()
                      ],
                    ),
                  )
                ],
                backgroundColor: Colors.grey[100],
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: screenSize.width,
                          height: 65,
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            text: 'Deliver to: ',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13),
                                            children: [
                                              TextSpan(
                                                text: name ?? '',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        address ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        pincode ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.zero),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                        side: MaterialStatePropertyAll(
                                          BorderSide.none,
                                        ),
                                        elevation: MaterialStatePropertyAll(0)),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SizedBox(
                                                height: 450,
                                                width: screenSize.width,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 3),
                                                  child: Column(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "ADD ADDRESS",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: TextFormField(
                                                          // validator: (value){
                                                          //   if(value== null || value.isEmpty){
                                                          //     return ""
                                                          //   }
                                                          //   return null;
                                                          // },
                                                          controller:
                                                              nameController,
                                                          decoration:
                                                              InputDecoration(
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: Colors.grey
                                                                  .shade400,
                                                            )),
                                                            fillColor: Colors
                                                                .grey[200],
                                                            filled: true,
                                                            hintText: "Name*",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: TextFormField(
                                                          controller:
                                                              mobilenoController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 10,
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  )),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  filled: true,
                                                                  hintText:
                                                                      "Mobile no*",
                                                                  counterText:
                                                                      ""),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: TextFormField(
                                                          controller:
                                                              pinController,
                                                          maxLength: 6,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  )),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  filled: true,
                                                                  hintText:
                                                                      "Pin Code*",
                                                                  counterText:
                                                                      ""),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: TextFormField(
                                                          controller:
                                                              addressController,
                                                          decoration:
                                                              InputDecoration(
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: Colors.grey
                                                                  .shade400,
                                                            )),
                                                            fillColor: Colors
                                                                .grey[200],
                                                            filled: true,
                                                            hintText:
                                                                "Address(House No,Building,Street,Area)*",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: TextFormField(
                                                          controller:
                                                              locatityController,
                                                          decoration:
                                                              InputDecoration(
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: Colors.grey
                                                                  .shade400,
                                                            )),
                                                            fillColor: Colors
                                                                .grey[200],
                                                            filled: true,
                                                            hintText:
                                                                "Locatity/Town*",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 50,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    cityController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  )),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  filled: true,
                                                                  hintText:
                                                                      "City/District*",
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 50,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    stateController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  )),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          200],
                                                                  filled: true,
                                                                  hintText:
                                                                      "State*",
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 7),
                                                      SizedBox(
                                                        width:
                                                            screenSize.width *
                                                                0.92,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  const MaterialStatePropertyAll(
                                                                      Colors
                                                                          .black),
                                                              side:
                                                                  const MaterialStatePropertyAll(
                                                                      BorderSide
                                                                          .none),
                                                              shape:
                                                                  MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              saveAddress();
                                                              log(name
                                                                  .toString());
                                                              log(mobileno
                                                                  .toString());
                                                            },
                                                            child: const Text(
                                                              'SAVE ADDRESS',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: const Text(
                                      'CHANGE',
                                      style: TextStyle(
                                          color: Color(0xfff4456e),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Offer
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: screenSize.width,
                          height: 155,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/image/offer1.png',
                                      height: 17,
                                    ),
                                    const SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: RichText(
                                        text: const TextSpan(
                                            text: 'Offers ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                            children: [
                                              TextSpan(
                                                  text: '(3)',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),

                              //Offer Inside Container

                              SizedBox(
                                height: 95,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          height: 105,
                                          decoration: BoxDecoration(
                                              // color: colorList[index],
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //Offer Inside Container Ends

                              const SizedBox(height: 10),

                              Center(
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count: 3,
                                  effect: const ExpandingDotsEffect(
                                    dotHeight: 5,
                                    dotWidth: 5,
                                    activeDotColor: Colors.black,
                                    expansionFactor: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Offer Part Ends Here

                      //Items Selected

                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              side: const BorderSide(width: 0.8),
                              value: isChecked,
                              onChanged: (value) {
                                getCheckBoxValue(value!);
                              },
                              overlayColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              //activeColor: const Color(0xfff4456e),
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                              tristate: false,
                            ),
                          ),
                          // const SizedBox(width: 5),
                          RichText(
                            text: const TextSpan(
                                text: '3/3 ITEMS SELECTED ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: '(₹ 2,702)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffff406c)),
                                  )
                                ]),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              size: 17,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 17,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 17,
                            ),
                          ),
                        ],
                      ),

                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: bagshoes.length,
                        itemBuilder: (context, i) {
                          Map<String, dynamic> shoe = bagshoes[i];

                          log(totalAmount.toString());

                          // Build your UI for each shoe item
                          return BagCard(
                            label: shoe["label"],
                            imgurl: shoe["img_url"],
                            brand: shoe["brand"],
                            price: shoe["price"].toString(),
                            shoe: shoe,
                            seller: shoe["seller"],
                            qty: shoe["qnty"],
                            size: shoe["size"],
                            isretunable: shoe["is_returnable"],
                            offer: shoe["offer"].toString(),
                            selectQTy: shoe["selectesQty"],
                            selectedSize: shoe["selectedSize"],
                          );
                        },
                      ),

                      // Gifting and Personalisation

                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: SizedBox(
                          // color: Colors.blue,
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'GIFTING AND PERSONALISATION',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.5),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: screenSize.width,
                        height: 100,
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xfffff2ec),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4))),
                                child: Image.asset("assets/image/gifts.png"),
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xfffff2ec),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4))),
                                padding: const EdgeInsets.all(10),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Buying for a loved one ?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Get wrap and personalised message on card',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Text(
                                      'Only for ₹25',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // ENd of Gifting

                      // COUPONS

                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: SizedBox(
                          // color: Colors.blue,
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'COUPONS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.5),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: screenSize.width,
                        height: 195,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/image/offer1.png',
                                    height: 18,
                                  ),
                                  const SizedBox(width: 7),
                                  const Text(
                                    'Best Coupon For You',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      log('Chatle');
                                    },
                                    child: const Row(
                                      children: [
                                        Text(
                                          'All Coupons',
                                          style: TextStyle(
                                              color: Color(0xfff4456e),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Color(0xfff4456e),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 8),

                            //Coupon Inside Container

                            SizedBox(
                              height: 130,
                              child: PageView.builder(
                                controller: _couponPageController,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Container(
                                        width: screenSize.width * 0.94,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            // color: colorList[index],
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text(
                                              'Save upto ₹150',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                                'Shop for 1 item(s) more to apply'),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  // color: Colors.red,
                                                  width: 115,
                                                  height: 50,
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'assets/image/coupon_code_area.png',
                                                      ),
                                                      Center(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "FWD15",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                SizedBox(
                                                  height: 42,
                                                  width: 90,
                                                  child: ElevatedButton(
                                                    style: const ButtonStyle(
                                                        padding:
                                                            MaterialStatePropertyAll(
                                                                EdgeInsets
                                                                    .zero),
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.white),
                                                        side:
                                                            MaterialStatePropertyAll(
                                                          BorderSide(
                                                            color: Color(
                                                                0xfff4456e),
                                                          ),
                                                        ),
                                                        elevation:
                                                            MaterialStatePropertyAll(
                                                                0)),
                                                    onPressed: () {},
                                                    child: const Text(
                                                        '+ADD ITEM',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xfff4456e),
                                                        )),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            //COUPONS Inside Container Ends

                            const SizedBox(height: 10),

                            Center(
                              child: SmoothPageIndicator(
                                controller: _couponPageController,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                  dotHeight: 5,
                                  dotWidth: 5,
                                  activeDotColor: Colors.black,
                                  expansionFactor: 2,
                                ),
                              ),
                            ),

                            // COUPONS Part Ends here
                          ],
                        ),
                      ),

                      // ENd of COUPONS

                      // PRICE DETAILS

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: screenSize.width,
                          height: 250,
                          color: Colors.white,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PRICE DETAILS (${bagshoes.length} Items)',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text(
                                    'Total MRP',
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹ $totalAmount",
                                    style: const TextStyle(fontSize: 12.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Discount on MRP',
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹ $totalOffer",
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 12.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Coupon Discount',
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      log('Apply Coupon da namme');
                                    },
                                    child: const Text(
                                      'Apply Coupon',
                                      style: TextStyle(
                                          color: Color(0xfff4456e),
                                          fontSize: 12.5),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Convenience Fee',
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      log('Know More da namme');
                                    },
                                    child: const Icon(
                                      Icons.info_outline_rounded,
                                      color: Color(0xfff4456e),
                                      size: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Free',
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text(
                                    'Total Amount',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹$totalAmount",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ENd of PRICE DETAILS
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: screenSize.width,
                          height: 200,
                          color: Colors.white,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Paymet Method',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(),
                              Container(
                                height: 55,
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Colors.grey)),
                                child: RadioListTile(
                                  activeColor: Colors.black,
                                  title: Row(
                                    children: [
                                      Lottie.asset(
                                          'assets/lotti/cashondelivery.json',
                                          width: 30),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        "Pay On Delivery/Cash on Delivery ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  value: "Cash on Delivery",
                                  groupValue: _paymentMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      _paymentMethod = value.toString();
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 55,
                                width: screenSize.width,

                                // color: Colors.grey,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Colors.grey)),
                                child: RadioListTile(
                                  activeColor: Colors.black,
                                  title: Row(
                                    children: [
                                      Lottie.asset('assets/lotti/upi.json',
                                          width: 25),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        'UPI Payment',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  value: 'UPI Payment',
                                  groupValue: _paymentMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      _paymentMethod = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/image/original2.png',
                                  height: 40,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Genuine Products',
                                  style: TextStyle(
                                      color: Color(0xff6c6d79), fontSize: 11),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7.0),
                              child: CircleAvatar(
                                  backgroundColor: Color(0xff6c6d79),
                                  radius: 3),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/image/contactless_delivery.png',
                                  height: 40,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Contactless Delivery',
                                  style: TextStyle(
                                      color: Color(0xff6c6d79), fontSize: 11),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7.0),
                              child: CircleAvatar(
                                  backgroundColor: Color(0xff6c6d79),
                                  radius: 3),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/image/secure_payment.png',
                                  height: 40,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Secure Payments',
                                  style: TextStyle(
                                      color: Color(0xff6c6d79), fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                color: Colors.white,
                height: 90,
                child: Column(
                  children: [
                    Container(
                      height: 23,
                      width: screenSize.width,
                      // color: const Color.fromARGB(255, 255, 230, 224),
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text(
                          "3 Items selected for order",
                          style: TextStyle(fontSize: 12),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: screenSize.width * 0.92,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                            side:
                                const MaterialStatePropertyAll(BorderSide.none),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('order')
                                .add({
                                  'name': name,
                                  'address': address,
                                  "pincode": pincode,
                                  "totalamount": totalAmount,
                                  "numOfiteam": bagshoes.length,
                                  "productId": productId,
                                  "mobileno": mobileno,
                                })
                                .whenComplete(() => EasyLoading.showSuccess(
                                    "Order Sucessfully",
                                    duration: const Duration(seconds: 1)))
                                .whenComplete(() => context.router
                                    .push(const OrderSucssfull()));
                          },
                          child: const Text(
                            'Place Order',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
