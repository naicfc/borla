import 'package:edlege/pages/howto/cancel.dart';
import 'package:edlege/pages/howto/credits.dart';
import 'package:edlege/pages/howto/requests.dart';
import 'package:edlege/pages/howto/subscription.dart';
import 'package:flutter/material.dart';

class Track extends StatelessWidget {
  const Track({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
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
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: SearchTextField(hintText: "How may we help you"),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HelpSection()),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "FREQUENTLY ASKED QUESTIONS",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const DropDownList(),
      ]),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;

  const SearchTextField({Key? key, required this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.green.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.green.shade400),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.green.shade600,
          )),
    );
  }
}

class HelpSection extends StatelessWidget {
  const HelpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 16.0, // Horizontal spacing
        mainAxisSpacing: 16.0, // Vertical spacing
        shrinkWrap: true, // Ensures the grid doesn't take extra space
        physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
        children: const [
          HelpCard(
            icon:
                "assets/images/cash.png", // Replace with appropriate icons/images
            text: "How to buy Borla Credits",
            destinationPage: Credits(),
          ),
          HelpCard(
            icon:
                "assets/images/bintouch.png", // Replace with appropriate icons/images
            text: "How to make a Pick-up Request",
            destinationPage: Requests(),
          ),
          HelpCard(
            icon:
                "assets/images/note.png", // Replace with appropriate icons/images
            text: "How to make a subscription",
            destinationPage: Subscription(),
          ),
          HelpCard(
            icon:
                "assets/images/bincancel.png", // Replace with appropriate icons/images
            text: "How to cancel a Pick-up Request",
            destinationPage: Cancel(),
          ),
        ],
      ),
    );
  }
}

class HelpCard extends StatelessWidget {
  final String icon;
  final String text;
  final Widget destinationPage;

  const HelpCard(
      {Key? key,
      required this.icon,
      required this.text,
      required this.destinationPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(icon),
              width: 50,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatelessWidget {
  const DropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Dropdown 1: Request had a pick-up issue
        DropdownExpansionTile(
          title: "Request had pickup issues",
          imagePath: "assets/images/bag.png",
          answer: "borlaManDetails1",
        ),
        DropdownExpansionTile(
          title: "Issues with borla man details",
          imagePath: "assets/images/binman.png",
          answer: "borlaManDetails1",
        ),
        DropdownExpansionTile(
          title: "Request had payment issues",
          imagePath: "assets/images/coins.png",
          answer: "borlaManDetails1",
        ),
      ],
    );
  }
}

class DropdownExpansionTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String answer;

  const DropdownExpansionTile(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
            collapsedBackgroundColor: Colors.grey[200],
            backgroundColor: Colors.grey[300],
            collapsedShape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            leading: Image(
              image: AssetImage(imagePath),
              width: 30,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            children: [DropdownListTile(tileText: answer)]));
  }
}

class DropdownListTile extends StatelessWidget {
  final String tileText;
  const DropdownListTile({
    Key? key,
    required this.tileText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Align(
          alignment: Alignment.center,
          child: Text(tileText),
        ),
      ),
      onTap: () {},
    );
  }
}
