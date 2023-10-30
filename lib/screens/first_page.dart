import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/login.dart';
import 'package:smart_garden_app/screens/register.dart';
import 'package:smart_garden_app/widgets/register_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 147, 89, 1),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 64, bottom: 52, right: 24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                height: 32,
                child: Image.asset('lib/assets/aepod_logo.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeTextsWidgets(),
                  getLoginRegisterButtons(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column welcomeTextsWidgets() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Welcome to Aepod',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Grow plants easily from your home with our award-winning pods.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Column getLoginRegisterButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterButton(
          buttonAction: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          buttonTitle: 'Register',
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0),
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
