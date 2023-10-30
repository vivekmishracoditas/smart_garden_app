import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LemonBalmCarouselBottomSheet extends StatefulWidget {
  const LemonBalmCarouselBottomSheet({super.key});

  @override
  State<LemonBalmCarouselBottomSheet> createState() =>
      _LemonBalmCarouselBottomSheetState();
}

class _LemonBalmCarouselBottomSheetState
    extends State<LemonBalmCarouselBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromRGBO(6, 73, 44, .25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      // child: Image.asset('lib/assets/plant.png'),
                      child: CarouselSlider(
                        items: [
                          Image.asset('lib/assets/plant.png'),
                          Image.asset('lib/assets/plant.png'),
                          Image.asset('lib/assets/plant.png'),
                          Image.asset('lib/assets/plant.png'),
                        ],
                        options: CarouselOptions(
                            viewportFraction: .35,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Color.fromRGBO(6, 73, 44, 0.3),
                        ),
                        Text(
                          'Lemon Balm',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Color.fromRGBO(6, 73, 44, 0.3),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Herb',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 73, 44, .75),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Harvest in 3 days',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 73, 44, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Planted 8 days ago ',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 73, 44, 0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(12, 147, 89, .1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const ImageIcon(
                          AssetImage('lib/assets/temprature.png'),
                          color: Color.fromRGBO(59, 206, 172, 1),
                          size: 24,
                        ),
                        const Text(
                          '23°c',
                          style: TextStyle(
                            color: Color.fromRGBO(6, 73, 44, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Color.fromRGBO(59, 206, 172, 1),
                          size: 16,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          width: 1,
                          color: const Color.fromRGBO(6, 73, 44, .5),
                        ),
                        const ImageIcon(
                          AssetImage('lib/assets/water_level.png'),
                          color: Color.fromRGBO(59, 206, 172, 1),
                          size: 24,
                        ),
                        const Text(
                          '85%',
                          style: TextStyle(
                            color: Color.fromRGBO(6, 73, 44, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Color.fromRGBO(59, 206, 172, 1),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'See growing tips',
                    style: TextStyle(
                      color: Color.fromRGBO(12, 147, 89, 1),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
