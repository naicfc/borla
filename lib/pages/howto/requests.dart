import 'package:edlege/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.green),
              padding: const EdgeInsets.all(16),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "How To's",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "How to make a Pick Up Today Request",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const TextWithLink(
                    text1:
                        "Before making a request, make sure you have enough borla credits. If you do not, go to ",
                    text2: "How to buy Borla Credits ",
                    text3: "and follow the steps.",
                    linkDestination: Home(),
                  ),
                  const Text(
                      "If you have enough borla credits, follow the steps below"),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "STEPS",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextWithLink(
                    text1: "1. Tap on the ",
                    text2: "'Pick Up Today' ",
                    text3: "button on your dashboard",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "2. Choose the type of request you want to make ( Standard or Special)"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "3a. If Standard, select your bin size and number, and type of rubbish"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "3b. If Special, select the type of rubbish and add a picture"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("4. Select your location for pisk-up"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "5. Confirm your request and pay with your credits"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "NB: Until your current bin request has been picked up by a borla man, you can't submit another bin request of the same type"),
                ],
              ),
            )
          ]),
        ),
      ),
    ]);
  }
}

class TextWithLink extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Widget linkDestination;

  const TextWithLink(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.linkDestination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: text2, // Link-like text
            style: TextStyle(
              color: Colors.amber.shade500, // Underline like a link
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => linkDestination));
              },
          ),
          TextSpan(text: text3),
        ],
      ),
    );
  }
}
