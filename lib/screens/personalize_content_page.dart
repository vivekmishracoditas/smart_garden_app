import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/lets_set_you_up.dart';
import 'package:smart_garden_app/widgets/register_button.dart';

class PersonalizeContentPage extends StatelessWidget {
  const PersonalizeContentPage({super.key});

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
                getNameWidget(),
              ],
            ),
            RegisterButton(
              buttonAction: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LetsSetYouUpPage(),
                  ),
                );
              },
              buttonTitle: 'Continue',
            )
          ],
        ),
      ),
    );
  }

  Padding getNameWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.white),
          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white, debugLabel: 'Email'),
      ),
    );
  }

  Padding getRegisterLabelDesc() {
    return const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Text(
        'What can we call you? Could be your name, a nickname or something funny ☺.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Text getRegisterLabelHeader() {
    return const Text(
      'Let’s personalize your experience',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
