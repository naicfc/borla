import 'package:edlege/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

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
                "How to make a Subscription",
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
                      "A Subscription is a great way to have your borla picked up constantly without having to make daily requests. Just follow these steps to make your subscription."),
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
                    text2: "'Subscriptions' ",
                    text3: "button on your dashboard",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "2. Select what kind of subscription you want and the frequency of pick-ups you want per week"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "3. Select the rubbish type and size. Choose the quantity as well"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "4. Input your location and confirm your subscription by making payment with your credits"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "NB: You can only make multiple subscriptions for different types of rubbish"),
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
