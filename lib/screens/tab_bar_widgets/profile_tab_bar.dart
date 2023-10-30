import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/shop_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getTopTitleWidget(),
            getAepodStoreWidget(),
            getBottomSettings(),
          ],
        ),
      ),
    );
  }

  Widget getBottomSettings() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getSettingsRow(
            leftIcon: 'lib/assets/wifi.png',
            leftTitle: 'Language',
            rightTitle: 'English',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/bulb.png',
            leftTitle: 'Currency',
            rightTitle: 'USD',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/temprature.png',
            leftTitle: 'Temperature Unit',
            rightTitle: 'Celsius',
          ),
          getSeperator(),
          getSettingsRow(
            leftIcon: 'lib/assets/sync.png',
            leftTitle: 'Sync Settings',
            rightTitle: '',
          ),
        ],
      ),
    );
  }

  Container getAepodStoreWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopPage(),
                ),
              );
            },
            child: getSettingsRow(
              leftIcon: 'lib/assets/aepod_store.png',
              leftTitle: 'Visit the Aepod Store',
              rightTitle: '',
            ),
          ),
          getSeperator(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Buy attachments and supplements for your Aepod. Orders typically arrive in 3 working days',
              style:
                  TextStyle(color: Color.fromRGBO(17, 17, 17, 1), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Row getTopTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hey, Isaac 🌿',
          style: TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color.fromRGBO(12, 147, 89, 0.05),
          ),
          child: const ImageIcon(
            AssetImage('lib/assets/edit.png'),
            color: Color.fromRGBO(12, 147, 89, 1),
            size: 20,
          ),
        ),
      ],
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
