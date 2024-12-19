import 'package:flutter/material.dart';

class SelectHelp extends StatelessWidget {
  const SelectHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.green),
        padding: const EdgeInsets.all(16),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Support Center",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Align(
        alignment: Alignment.center,
        child: Text(
          "Get Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const DropDowmList()
    ]);
  }
}

class DropDowmList extends StatelessWidget {
  const DropDowmList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> borlaManDetails1 = [
      'Borla was never picked up',
      'Borla was picked up late',
    ];

    final List<String> borlaManDetails2 = [
      'Didn’t match photo',
      'Was rude and disrespectful',
    ];

    final List<String> borlaManDetails3 = [
      'I was charged multiple times',
      'I was charged the wrong amount',
      'Issue paying with card',
      'Issue paying with mobile money'
    ];

    return Expanded(
      child: ListView(
        children: [
          // Dropdown 1: Request had a pick-up issue
          DropdownExpansionTile(
            title: "Request had pickup issues",
            imagePath: "assets/images/bag.png",
            listTitles: borlaManDetails1,
          ),
          DropdownExpansionTile(
            title: "Issues with borla man details",
            imagePath: "assets/images/binman.png",
            listTitles: borlaManDetails2,
          ),
          DropdownExpansionTile(
            title: "Request had payment issues",
            imagePath: "assets/images/coins.png",
            listTitles: borlaManDetails3,
          ),
        ],
      ),
    );
  }
}

class DropdownExpansionTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final List listTitles;

  const DropdownExpansionTile(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.listTitles})
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
          children: listTitles
              .map((item) => DropdownListTile(
                    tileText: item,
                  ))
              .toList()),
    );
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
