import 'package:flutter/material.dart';
import 'package:smart_garden_app/widgets/add_plant_to_cart_bottom_sheet.dart';

class LemonBalmBottomSheet extends StatefulWidget {
  const LemonBalmBottomSheet({super.key});

  @override
  State<LemonBalmBottomSheet> createState() => _LemonBalmBottomSheetState();
}

class _LemonBalmBottomSheetState extends State<LemonBalmBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 64,
                    height: 16,
                    child: Image.asset('lib/assets/bottom_sheet_arrow.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lemon Balm',
                          style: TextStyle(
                            color: Color.fromRGBO(17, 17, 17, 1),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Herb . \$20',
                          style: TextStyle(
                            color: Color.fromRGBO(6, 73, 44, .75),
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          '121 people are growing this 🌿',
                          style: TextStyle(
                            color: Color.fromRGBO(17, 17, 17, .75),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset('lib/assets/plant.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 52,
                      child: Image.asset(
                        'lib/assets/heart_box.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 52,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(12, 147, 89, 1),
                            ),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          onPressed: () {},
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Color.fromRGBO(6, 73, 44, 0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk. The opposed leaves, whose stalked stems vary in length, are broadly oval to heart-shaped and have an irregular crenate (rounded teeth) or serrate (small, sharp teeth) edge.',
                  style: TextStyle(
                    color: Color.fromRGBO(17, 17, 17, 1),
                    fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Growing information',
                  style: TextStyle(
                    color: Color.fromRGBO(6, 73, 44, 0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              getSettingsRow(
                leftIcon: 'lib/assets/temprature.png',
                leftTitle: 'Room temparature is fine',
              ),
              getSettingsRow(
                leftIcon: 'lib/assets/drop.png',
                leftTitle: 'Regular watering works best',
              ),
              getSettingsRow(
                leftIcon: 'lib/assets/flower.png',
                leftTitle: 'Typically ready for harvest after 4 weeks',
              ),
              getIdDetailsWidget('Other  Herbs'),
              getOurNurseryListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getIdDetailsWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromRGBO(6, 73, 44, .5),
            fontSize: 16,
            fontWeight: FontWeight.w700),
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
      onTap: () {
        showModalBottomSheet(
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
        );
      },
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

  Container getSettingsRow({
    required String leftIcon,
    required String leftTitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(leftIcon),
                color: const Color.fromRGBO(59, 206, 172, 0.75),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
        ],
      ),
    );
  }
}
