import 'package:flutter/material.dart';
import 'package:smart_garden_app/widgets/lemon_balm_carousel_bottomSheet.dart';

class GardenDetails extends StatefulWidget {
  const GardenDetails({super.key});

  @override
  State<GardenDetails> createState() => _GardenDetailsState();
}

class _GardenDetailsState extends State<GardenDetails> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 255, 242),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 245,
                  child: Image.asset(
                    'lib/assets/garden_details_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTopTitleWidget(),
                      getIdDetailsWidget(),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(6, 73, 44, .10),
                        ),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getTopTabBarWidget(
                              text: 'PLANTS',
                              isSelected: selectedTab == 0,
                              index: 0,
                            ),
                            getTopTabBarWidget(
                              text: 'LOG',
                              isSelected: selectedTab == 1,
                              index: 1,
                            ),
                            getTopTabBarWidget(
                              text: 'SETTINGS',
                              isSelected: selectedTab == 2,
                              index: 2,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: getBottomContainer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getTopActionButtonsWidget(),
          ],
        ),
      ),
    );
  }

  Widget getBottomContainer() {
    switch (selectedTab) {
      case 0:
        return getPlantsContainer();
      case 1:
        return getLogContainer();
      case 2:
        return getSettingsTabBarItems();
      default:
        return Container();
    }
  }

  Widget getLogContainer() {
    return Column(
      children: [
        getSortByWidget(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  getWaterRefillWarningWidget(),
                  getWaterRefillWarningDescription(),
                  getRefillNowWidget(),
                ],
              ),
              getNewCycleStartedWidget(),
              getOreganoReadyWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Container getOreganoReadyWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      height: 58,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(6, 73, 44, .1)),
      ),
      child: getOreganoRowWidget(isOreganoReady: true),
    );
  }

  Padding getOreganoRowWidget({required bool isOreganoReady}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  isOreganoReady
                      ? 'lib/assets/flower.png'
                      : 'lib/assets/play_icon.png',
                  color: const Color.fromRGBO(6, 73, 44, .5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  isOreganoReady
                      ? 'Oregano ready for harvest'
                      : 'New cycle started',
                  style: const TextStyle(
                    color: Color.fromRGBO(6, 73, 44, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            isOreganoReady ? '2  days ago' : '5m',
            style: const TextStyle(
              color: Color.fromRGBO(17, 17, 17, .75),
            ),
          ),
        ],
      ),
    );
  }

  Container getNewCycleStartedWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(6, 73, 44, .1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            getOreganoRowWidget(isOreganoReady: false),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Text(
                  'You just started a new cycle, time to grow new plants 😊 '),
            ),
          ],
        ),
      ),
    );
  }

  Container getWaterRefillWarningDescription() {
    return Container(
      alignment: Alignment.center,
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
          right: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
          bottom: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'This Aepod’s water level is low (10%), you should refill it.',
          style: TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Container getRefillNowWidget() {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
          right: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
          bottom: BorderSide(color: Color.fromRGBO(6, 73, 44, .1)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Refill Now',
              style: TextStyle(
                color: Color.fromRGBO(12, 147, 89, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            getIcon(isDownArrow: false),
          ],
        ),
      ),
    );
  }

  Container getWaterRefillWarningWidget() {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(12, 147, 89, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning_amber,
                  color: Color.fromRGBO(255, 255, 255, .5),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Water Refill Due',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '5hr ago',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getSortByWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sort by:',
            style: TextStyle(
              color: Color.fromRGBO(6, 73, 44, .75),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                'Urgency: High to Low',
                style: TextStyle(
                  color: Color.fromRGBO(12, 147, 89, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              getIcon(isDownArrow: true),
            ],
          )
        ],
      ),
    );
  }

  Container getIcon({
    required bool isDownArrow,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromRGBO(12, 147, 89, .10),
      ),
      width: 28,
      height: 28,
      child: Icon(
        isDownArrow
            ? Icons.keyboard_arrow_down_outlined
            : Icons.arrow_forward_ios,
        color: const Color.fromRGBO(12, 147, 89, 1),
        size: isDownArrow ? 24 : 16,
      ),
    );
  }

  Widget getPlantsContainer() {
    return Column(
      children: [
        getPlantsTopContainer(),
        getPlantsBottomContainer(),
      ],
    );
  }

  Widget getPlantsBottomContainer() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            getGrowingNowWidget(),
            getFlowerRowWidget(
              title: 'Basil',
              subtitle: 'Herb',
              rightText1: 'Harvest in 3 days',
              rightText2: 'Planted 8 days ago ',
            ),
            getFlowerRowWidget(
              title: 'Mint',
              subtitle: 'Herb',
              rightText1: 'Harvest in 10 days',
              rightText2: 'Planted 5 days ago ',
            ),
            getFlowerRowWidget(
              title: 'Lemon Balm',
              subtitle: 'Herb',
              rightText1: 'Harvest in 15 days',
              rightText2: 'Planted yesterday ',
            ),
            getFlowerRowWidget(
              title: 'Oregano',
              subtitle: 'Herb',
              rightText1: 'Harvest in 3 weeks',
              rightText2: 'Planted today ',
            ),
            getFlowerRowWidget(
              title: 'Lemon Balm',
              subtitle: 'Herb',
              rightText1: 'Harvest in 5 weeks',
              rightText2: 'Planted today ',
            ),
          ],
        ),
      ),
    );
  }

  Widget getFlowerRowWidget({
    required String title,
    required String subtitle,
    required String rightText1,
    required String rightText2,
  }) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => const FractionallySizedBox(
            heightFactor: 0.60,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: LemonBalmCarouselBottomSheet(),
            ),
          ),
        );
      },
      child: ListTile(
        leading: Image.asset('lib/assets/plant.png'),
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 1),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color.fromRGBO(6, 73, 44, .5),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              rightText1,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, .75),
              ),
            ),
            Text(
              rightText2,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, .75),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getGrowingNowWidget() {
    return Container(
      color: const Color.fromRGBO(12, 147, 89, 0.1),
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      margin: const EdgeInsets.all(4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage('lib/assets/flower.png'),
            color: Color.fromRGBO(6, 73, 44, 0.75),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Growing now',
              style: TextStyle(
                color: Color.fromRGBO(6, 73, 44, .75),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container getPlantsTopContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          getPlantsTopRow(
            leftIcon: 'lib/assets/flower.png',
            leftTitle: 'Using 6 out 9 pods',
          ),
          getPlantsTopRow(
            leftIcon: 'lib/assets/timer.png',
            leftTitle: 'Basil will be ready for harvest in 3 days',
          ),
        ],
      ),
    );
  }

  Widget getPlantsTopRow({
    required String leftIcon,
    required String leftTitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(leftIcon),
            color: const Color.fromRGBO(59, 206, 172, 0.75),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              leftTitle,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTopTabBarWidget({
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedTab = index;
      }),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        margin: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? const Color.fromRGBO(6, 73, 44, 1)
                : const Color.fromRGBO(12, 147, 89, .5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Text getTopTitleWidget() {
    return const Text(
      'Charlie’s Garden',
      style: TextStyle(
        color: Color.fromRGBO(17, 17, 17, 1),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getIdDetailsWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'ID: 1344295024',
        style: TextStyle(
          color: Color.fromRGBO(17, 17, 17, .5),
          fontSize: 14,
        ),
      ),
    );
  }

  Positioned getTopActionButtonsWidget() {
    return Positioned(
      top: 64,
      left: 5,
      right: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 121,
            height: 70,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'lib/assets/go_back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset(
              'lib/assets/more.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSettingsTabBarItems() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          getSettingsRow(
            leftIcon: 'lib/assets/wifi.png',
            leftTitle: 'Connectivity',
            rightTitle: 'Connected via Wifi',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/bulb.png',
            leftTitle: 'Plantlight Settings',
            rightTitle: 'Currently ON',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/flower.png',
            leftTitle: 'Cycle Settings',
            rightTitle: '',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/sync.png',
            leftTitle: 'Aepod Sync Settings',
            rightTitle: '',
          ),
        ],
      ),
    );
  }

  Container getSeperator() {
    return Container(
      height: 1,
      color: const Color.fromRGBO(6, 73, 44, 0.1),
    );
  }

  Container getSettingsRow({
    required String leftIcon,
    required String leftTitle,
    required String rightTitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(leftIcon),
                color: const Color.fromRGBO(59, 206, 172, 0.75),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  leftTitle,
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
            children: [
              Text(
                rightTitle,
                style: const TextStyle(
                  color: Color.fromRGBO(6, 73, 44, 0.75),
                  fontSize: 14,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(12, 147, 89, 1),
                  size: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
