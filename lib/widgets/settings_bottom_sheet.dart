import 'package:flutter/material.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key});

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
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
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Light Status',
                    style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, 1),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(top: 20),
                  color: const Color.fromRGBO(6, 73, 44, 0.2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lights',
                        style: TextStyle(
                          color: Color.fromRGBO(6, 73, 44, 1),
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        onChanged: (status) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(top: 10),
                  color: const Color.fromRGBO(6, 73, 44, 0.2),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Automatic Settings',
                        style: TextStyle(
                          color: Color.fromRGBO(6, 73, 44, 1),
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Off at Sunset',
                            style: TextStyle(
                              color: Color.fromRGBO(6, 73, 44, 0.75),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(6, 73, 44, 1),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(top: 30),
                  color: const Color.fromRGBO(6, 73, 44, 0.2),
                ),
              ],
            ),
            const Text(
              'Go to Settings',
              style: TextStyle(
                color: Color.fromRGBO(12, 147, 89, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
