import 'package:edlege/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Cancel extends StatelessWidget {
  const Cancel({super.key});

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
                "How to cancel a Request",
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
                  const Text(
                      "No longer interested in getting your borla picked up? You can cancel you requests by following the steps below"),
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
                    text2: "'Track' ",
                    text3:
                        "button on your task bar at the bottom of your screen",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("2. Choose the request you want to cancel.")),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextWithLink(
                    text1: "3. When the tracking map shows, select the  ",
                    text2: "'Cancel' ",
                    text3: "button",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextWithLink(
                    text1: "4. Click  ",
                    text2: "'Yes' ",
                    text3: "to confirm cancellation",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "NB: You can only cancel a pick-up within the first 5 minutes after requesting"),
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
    return Align(
      alignment: Alignment.topLeft,
      child: Text.rich(
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
      ),
    );
  }
}
