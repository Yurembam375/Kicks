import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sneaker_app/widgets/badgeCartno.dart';

class DetailsPage extends StatefulWidget {
  final String label;
  final String brand;
  final String discription;
  final String price;
  final String imageUrl;
  final String seller;
  final List<dynamic> size;

  const DetailsPage({
    super.key,
    required this.label,
    required this.brand,
    required this.discription,
    required this.price,
    required this.imageUrl, required this.seller, required this.size,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //final List<Map<String, dynamic>> data;
  final _controller = PageController();

  // List size = [6, 7, 8, 9, 10, 11, 12];

  int tabindex = 0;
  // Future<void> movetoBag() async {
  //   // Get a reference to the Firestore document
  //   DocumentReference documentReference = FirebaseFirestore.instance
  //       .collection('kicks')
  //       .doc("QzxblNC94G66oEoPteQ1");

  //   // Retrieve the document snapshot
  //   DocumentSnapshot snapshot = await documentReference.get();

  //   if (snapshot.exists) {
  //     // Get the 'shoes' array from the snapshot data
  //     List<dynamic> shoes = snapshot.get('shoes');
  //     for (var element in shoes) {
  //       if (element["product_Id"] == shoe["product_Id"]) {
  //         int productindex = shoes.indexOf(element);
  //         shoes[productindex]['add_to_bag'] = true;
  //         await documentReference.update({'shoes': shoes});
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.brand,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.5,
              ),
              maxLines: 1,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )),
           const BadgeCartno()
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 310,
                  child: PageView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 300,
                          color: Colors.white,
                          child: CachedNetworkImage(
                            imageUrl: widget.imageUrl,
                            height: 100,
                            width: 100,
                          ));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 270, 0, 0),
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: SwapEffect(
                            activeDotColor: Colors.grey.shade700,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.brand,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.label,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Explore Brand",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.discription,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12.5),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          "MRP",
                          style: TextStyle(color: Colors.grey, fontSize: 12.5),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "₹${widget.price}",
                          style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12.5),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          " ₹${widget.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        const Text(
                          " (30%OFF)",
                          style: TextStyle(color: Colors.red, fontSize: 10),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "inclusive off all taxes",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 12.5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              height: 75,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Bank Offers",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Text(
                      "Flat Rs 150 Cashback for select user or upto Rs500 Cashback on CRED pay UPI transaction . Min spend Rs 1500.Avilabale only on android device.",
                      style: TextStyle(color: Colors.black54, fontSize: 12.5))
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              height: 45,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "EMI option avilable ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View Plan",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "EMI starting from ₹53/month",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Size (UK Size):",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Size Chart",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Body Measurement: To Fit Foot Length 26.2cm",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.size.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                tabindex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == tabindex
                                        ? Colors.black
                                        : Colors.white,
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    widget.size[index].toString(),
                                    style: TextStyle(
                                      color: index == tabindex
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),

                      //Size widget
                  Row(
                    children: [
                      Text(
                        "₹ ${widget.price}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "₹ ${widget.price}",
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 13),
                      ),
                      const Text(
                        " (30%OFF)",
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      const Text(
                        "Seller: ",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                      Text(
                        widget.seller,
                        style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              height: 220,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Check Delivery",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 37,
                    width: 345,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.5))),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "  Enter PIN Code",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5))),
                          // filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.redAccent,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        CupertinoIcons.cube_box,
                        color: Colors.black,
                      ),
                      Text(
                        "    Express Delivery",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " might be avilable",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      Text(
                        "    Pay On Delivery",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " might be avilable",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.repeat_on_rounded,
                        color: Colors.black,
                      ),
                      Text(
                        "    Hassle free 7 &15",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Return & Exchange",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          " might be avilable",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: const [
                      Icon(
                        CupertinoIcons.bag,
                        color: Colors.black,
                      ),
                      Text(
                        "    Try & Buy",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " might be avilable",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Product Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Regular styling",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Slip on detail",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Cushioned footbed",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Warrenty:6 month",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Material & Care",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Upper material: Syntetic Suede",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Use dry cloth to remove dust",
                        style: TextStyle(color: Colors.black54, fontSize: 12.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image/original.png",
                        height: 40,
                      ),
                      const Text(
                        "Genuine Product",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    height: 50,
                    width: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image/quality.png",
                        height: 40,
                      ),
                      const Text(
                        "Quality Checked",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              height: 50,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 37,
                    width: 345,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.5))),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "  Write a review....",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5))),
                          // filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const ExpansionTile(
              backgroundColor: Colors.white,
              tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              iconColor: Colors.redAccent,
              collapsedIconColor: Colors.redAccent,
              title: Text(
                "View all review",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text(
                    "Goutam Dash",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "It is good product",
                    style: TextStyle(color: Colors.black54, fontSize: 12.5),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Tommy",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Product is good at this range of price.",
                    style: TextStyle(color: Colors.black54, fontSize: 12.5),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 90,
        child: Column(children: [
          Container(
            height: 23,
            width: double.infinity,
            //color: const Color.fromARGB(255, 255, 230, 224),
            color: Colors.grey[300],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Seller: ",
                    style: TextStyle(color: Colors.black54, fontSize: 12.5),
                  ),
                  Text(
                    "Leopold Foodwear India LLP",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                height: 35,
                width: 160,
                child: MaterialButton(
                  animationDuration: const Duration(milliseconds: 3),
                  highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 17,
                      ),
                      Text("  WISHLISTED")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(
                          Colors.black
                         // Color(0xffff406c)
                          ),
                    side: const MaterialStatePropertyAll(BorderSide.none),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  onPressed: () {
                    
                  },
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.bag,
                        color: Colors.white,
                        size: 17,
                      ),
                      Text(
                        "   ADD TO BAG",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
