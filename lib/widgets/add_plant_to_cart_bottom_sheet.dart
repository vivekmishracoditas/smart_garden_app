import 'package:flutter/material.dart';
import 'package:smart_garden_app/widgets/lemon_balm_bottom_sheet.dart';

class AddPlantToCartBottomSheet extends StatefulWidget {
  const AddPlantToCartBottomSheet({
    super.key,
    required this.title,
    required this.imageName,
    required this.price,
  });

  final String title;
  final String imageName;
  final String price;

  @override
  State<AddPlantToCartBottomSheet> createState() =>
      _AddPlantToCartBottomSheetState();
}

class _AddPlantToCartBottomSheetState extends State<AddPlantToCartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 35),
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
                    width: 120,
                    height: 120,
                    child: Image.asset(widget.imageName),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Herb . ${widget.price}',
                    style: const TextStyle(
                      color: Color.fromRGBO(12, 147, 89, 1),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, .75),
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => const FractionallySizedBox(
                          heightFactor: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            child: LemonBalmBottomSheet(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Read more',
                      style: TextStyle(
                        color: Color.fromRGBO(12, 147, 89, 1),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 10),
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(12, 147, 89, 1),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
