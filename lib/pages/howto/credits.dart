import 'package:edlege/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

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
                "How to buy Borla Credits",
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
                      "You would need to purchase some borla credits in order to make a borla request. Buying borla credits is simple with the following steps"),
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
                    text2: "'Buy More' ",
                    text3: "button on the Borla Credits dashboard",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextWithLink(
                    text1:
                        "2. Enter the amount you want to buy and tap on the  ",
                    text2: "'Make Payment' ",
                    text3: "button",
                    linkDestination: Home(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "3. Choose your purchase with either Mobile Money or your Bank Card"),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "NB: Kindly wait for your payment to confirm before leaving the payment page"),
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
