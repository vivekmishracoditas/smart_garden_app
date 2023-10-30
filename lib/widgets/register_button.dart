import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {Key? key, required this.buttonAction, required this.buttonTitle})
      : super(key: key);
  final VoidCallback buttonAction;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 10),
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: buttonAction,
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: Color.fromRGBO(12, 147, 89, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
