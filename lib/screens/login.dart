import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/home_page.dart';
import 'package:smart_garden_app/screens/register.dart';
import 'package:smart_garden_app/widgets/register_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 147, 89, 1),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 120, left: 24, right: 24, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTopWidget(),
            getBottomWidget(),
          ],
        ),
      ),
    );
  }

  Column getBottomWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RegisterButton(
          buttonAction: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          buttonTitle: 'Login',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: const Text(
              'New here? Register',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column getTopWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRegisterLabelHeader(),
        getRegisterLabelDesc(),
        getEmailWidget(),
        getPasswordWidget(),
        const Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Forgot Your Password?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        getSocialMediaLabelWdget(),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getSocialMediaButton(
                name: 'Facebook',
                iconPath: 'lib/assets/facebook_icon.png',
              ),
              const SizedBox(
                width: 20,
              ),
              getSocialMediaButton(
                name: 'Google',
                iconPath: 'lib/assets/google_icon.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Expanded getSocialMediaButton(
      {required String name, required String iconPath}) {
    return Expanded(
      child: SizedBox(
        height: 52,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          onPressed: () {},
          icon: ImageIcon(
            size: 24,
            AssetImage(iconPath),
            color: Colors.white,
          ),
          label: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding getSocialMediaLabelWdget() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Text(
        'Or Login using social media',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Padding getPasswordWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.lock_outline,
              color: Colors.white,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(left: 25),
            child: ImageIcon(
              AssetImage('lib/assets/show_password_icon.png'),
              color: Colors.white,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white, debugLabel: 'Email'),
      ),
    );
  }

  Padding getEmailWidget() {
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
          hintText: 'Email Address',
          hintStyle: TextStyle(color: Colors.white),
          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.email_outlined,
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
        'Let’s get back to growing your Aepod plants, shall we?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Text getRegisterLabelHeader() {
    return const Text(
      'Welcome back',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
