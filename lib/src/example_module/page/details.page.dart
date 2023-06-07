import 'package:flutter/material.dart';
import 'package:sneaker_app/model/basemodel.dart';
import 'package:sneaker_app/widgets/fav_botton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.data});
  final BaseModel data;
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
              child: Text(
            "Sneaker Details",
            style: TextStyle(color: Colors.black),
          )),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: FavBotton(),
            )
          ],
        ),
        body: Column(
          children: [
            // Expanded(
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       Container(
            //         margin: const EdgeInsets.only(left: 12),
            //         height: 300,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.grey[200]),
            //       ),
            //       RotationTransition(
            //         turns: const AlwaysStoppedAnimation(-25 / 360),
            //         child: Positioned(
            //           child: Image.asset(
            //             data.imageUrl,
            //             height: 250,
            //             width: 250,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     height: 300,
            //     width: double.infinity,
            //     color: Colors.yellow,
            //   ),
            // ),
            SizedBox(
              height: 305,
              child: PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 300,
                        color: Colors.red
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 142),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: SwapEffect(
                    activeDotColor: Colors.grey.shade700,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey.withOpacity(0.5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 247, 0),
              child: Text(
                data.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
              const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Text(data.dispription,style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17,
                     )),
            ),
             const SizedBox(
              height: 10,
            ),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 235, 0),
              child: Text(
                "Price: \$${data.price.toString()}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
