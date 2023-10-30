import 'package:flutter/material.dart';
import 'package:smart_garden_app/widgets/add_plant_to_cart_bottom_sheet.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
                const SizedBox(
                  width: double.infinity,
                  height: 144,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTopTitleWidget(),
                      getIdDetailsWidget('Popular items'),
                      getPopulerItemsListWidget(),
                      getIdDetailsWidget('Our nursery'),
                      getNurseryTabs(),
                      getOurNurseryListWidget(),
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

  Widget getNurseryTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          getNurseryTabContainer('All', true),
          getNurseryTabContainer('Ornamentals', false),
          getNurseryTabContainer('Supplements', false),
          getNurseryTabContainer('Herbs', false),
          getNurseryTabContainer('Others', false),
        ],
      ),
    );
  }

  Container getNurseryTabContainer(String title, bool isSelected) {
    var primaryColor = const Color.fromRGBO(59, 206, 172, 1);
    var secondaryColor = Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? secondaryColor : primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Container getPopulerItemsListWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          getPlantsRailCellWidget('Oregano', '\$25', 'lib/assets/oregano.png'),
          getPlantsRailCellWidget(
              'Lemon Balm', '\$10', 'lib/assets/lemon_balm.png'),
          getPlantsRailCellWidget(
              'Oregano 2', '\$30', 'lib/assets/oregano.png'),
          getPlantsRailCellWidget(
              'Lemon Balm 2', '\$20', 'lib/assets/oregano.png'),
          getPlantsRailCellWidget(
              'Oregano 3', '\$11', 'lib/assets/oregano.png'),
        ],
      ),
    );
  }

  Container getOurNurseryListWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          getPlantsRailCellWidget('Basil', '\$50', 'lib/assets/basil.png'),
          getPlantsRailCellWidget('Mint', '\$40', 'lib/assets/mint.png'),
          getPlantsRailCellWidget('Basil 2', '\$35', 'lib/assets/oregano.png'),
          getPlantsRailCellWidget('Mint 2', '\$22', 'lib/assets/mint.png'),
          getPlantsRailCellWidget('Basil 3', '\$11', 'lib/assets/basil.png'),
        ],
      ),
    );
  }

  Widget getPlantsRailCellWidget(String title, String price, String imageName) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => FractionallySizedBox(
          heightFactor: 0.70,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: AddPlantToCartBottomSheet(
              title: title,
              imageName: imageName,
              price: price,
            ),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 177,
              child: Image.asset(
                imageName,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, 1),
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                color: Color.fromRGBO(6, 73, 44, .75),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Text getTopTitleWidget() {
    return const Text(
      'Shop 🛒',
      style: TextStyle(
        color: Color.fromRGBO(17, 17, 17, 1),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getIdDetailsWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1),
            fontSize: 21,
            fontWeight: FontWeight.w500),
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
              'lib/assets/shopping_cart.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
