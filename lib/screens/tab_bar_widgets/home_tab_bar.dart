import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_garden_app/screens/garden_details.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 230,
                child: getCarouselSliderWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 24, top: 56),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getSmallContainerBox(
                          icon: 'lib/assets/humidity.png',
                          title: 'Humidity',
                          percentage: '74%',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        getSmallContainerBox(
                          icon: 'lib/assets/temprature.png',
                          title: 'Temprature',
                          percentage: '23°c',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        getSmallContainerBox(
                          icon: 'lib/assets/water_level.png',
                          title: 'Water Level',
                          percentage: '85%',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getSmallContainerBox(
                          icon: 'lib/assets/wifi.png',
                          title: 'Conectivity',
                          percentage: 'Online',
                          flex: 1,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        getLargeContainerBox(
                          topTitle: 'Nutrient Level',
                          firstIcon: 'lib/assets/weight.png',
                          firstTitle: '5 grams left',
                          secondIcon: 'lib/assets/refill.png',
                          secondTitle: 'Refill in 2 days',
                          flex: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getLargeContainerBox(
                          topTitle: 'Status',
                          firstIcon: 'lib/assets/plant_count.png',
                          firstTitle: '6 plants growing',
                          secondIcon: 'lib/assets/timer.png',
                          secondTitle: 'Next harvest in 3 days',
                          flex: 2,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        getSmallContainerBox(
                          icon: 'lib/assets/bulb.png',
                          title: 'Light Status',
                          percentage: 'On',
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 180,
            left: 60,
            right: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GardenDetails(),
                  ),
                );
              },
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Charlie’s Garden',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ID: 1344295024',
                            style: TextStyle(
                              color: Color.fromRGBO(17, 17, 17, .5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(12, 147, 89, 1),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider getCarouselSliderWidget() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        viewportFraction: 0.9,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                'lib/assets/slider_image1.png',
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Expanded getSmallContainerBox({
    required String icon,
    required String title,
    required String percentage,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(
              AssetImage(icon),
              size: 24,
              color: const Color.fromRGBO(59, 206, 172, .75),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 0.75),
                fontSize: 14,
              ),
            ),
            Text(
              percentage,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded getLargeContainerBox({
    required String topTitle,
    required String firstIcon,
    required String firstTitle,
    required String secondIcon,
    required String secondTitle,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topTitle,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 0.75),
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage(firstIcon),
                  size: 24,
                  color: const Color.fromRGBO(59, 206, 172, .75),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    firstTitle,
                    style: const TextStyle(
                      color: Color.fromRGBO(6, 73, 44, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage(secondIcon),
                  size: 24,
                  color: const Color.fromRGBO(59, 206, 172, .75),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    secondTitle,
                    style: const TextStyle(
                      color: Color.fromRGBO(6, 73, 44, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
