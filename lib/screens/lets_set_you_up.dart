import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/home_page.dart';
import 'package:smart_garden_app/widgets/register_button.dart';

class LetsSetYouUpPage extends StatelessWidget {
  const LetsSetYouUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 147, 89, 1),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 120, left: 24, right: 24, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getRegisterLabelHeader(),
                getRegisterLabelDesc(),
                getAvailableAepods(
                  title: 'Upstaires Pod',
                  subtitle: 'ID: 1344295024',
                  isSynced: true,
                  topPadding: 35,
                ),
                getAvailableAepods(
                  title: 'Porch Pod',
                  subtitle: 'ID: 1344295025',
                  isSynced: true,
                  topPadding: 12,
                ),
                getNewAepods(
                  title: 'Sync new Aepod',
                  topPadding: 12,
                ),
              ],
            ),
            RegisterButton(
                buttonAction: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                buttonTitle: 'Continue')
          ],
        ),
      ),
    );
  }

  Container getAvailableAepods({
    required String title,
    required String subtitle,
    required bool isSynced,
    required double topPadding,
  }) {
    return Container(
      margin: EdgeInsets.only(top: topPadding),
      width: double.infinity,
      height: 85,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white10,
        contentPadding: const EdgeInsets.only(left: 12, top: 8, right: 12),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        trailing: const SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Synced',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.check_circle,
                color: Colors.white70,
                size: 24,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container getNewAepods({
    required String title,
    required double topPadding,
  }) {
    return Container(
      margin: EdgeInsets.only(top: topPadding),
      width: double.infinity,
      height: 56,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white10,
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.add_circle_outlined,
          color: Colors.white70,
          size: 24,
        ),
      ),
    );
  }

  Padding getRegisterLabelDesc() {
    return const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Text(
        'Sync your Aepods with the app for added functionality',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Text getRegisterLabelHeader() {
    return const Text(
      'Let’s set you up',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
