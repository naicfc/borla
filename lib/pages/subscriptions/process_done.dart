import 'package:edlege/pages/subscriptions.dart';
import 'package:flutter/material.dart';

class ProcessDone extends StatelessWidget {
  const ProcessDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.green),
          padding: const EdgeInsets.all(16),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "My Subscriptions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/shareappicn.png"),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Text("You've done it!"),
                const Text("You have successfully created a subscription"),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Subscriptions()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  ),
                  child: const Text(
                    "View Subscriptions",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
