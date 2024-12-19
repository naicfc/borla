import 'package:flutter/material.dart';

class NonRequest extends StatelessWidget {
  const NonRequest({super.key});

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
          "Not related to a request",
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
      'Change phone number',
      'Change email address',
      'Delete my account and data',
    ];

    final List<String> borlaManDetails2 = [
      'Verify email address',
      'Verify phone number',
    ];

    final List<String> borlaManDetails3 = [
      'Receive all Borla App News',
      'Unsubscribe',
    ];

    final List<String> borlaManDetails4 = [
      'Become a borla man',
      'Become a Borla App Partner',
      'Become part of the team',
    ];

    final List<String> borlaManDetails5 = [
      'Terms and Conditions',
      'Privacy Policy',
    ];

    return Expanded(
      child: ListView(
        children: [
          // Dropdown 1: Request had a pick-up issue
          DropdownExpansionTile(
            title: "Account Details",
            imagePath: "assets/images/usericn.png",
            listTitles: borlaManDetails1,
          ),
          DropdownExpansionTile(
            title: "Verify my identity",
            imagePath: "assets/images/touch.png",
            listTitles: borlaManDetails2,
          ),
          DropdownExpansionTile(
            title: "Borla App newsletter",
            imagePath: "assets/images/message.png",
            listTitles: borlaManDetails3,
          ),
          DropdownExpansionTile(
            title: "Work with us",
            imagePath: "assets/images/circlebag.png",
            listTitles: borlaManDetails4,
          ),
          DropdownExpansionTile(
            title: "Policies",
            imagePath: "assets/images/note.png",
            listTitles: borlaManDetails5,
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
