import 'package:edlege/pages/subscriptions/manage_subscriptions.dart';
import 'package:edlege/pages/subscriptions/subscription_details.dart';
import 'package:edlege/pages/subscriptions/type.dart';
import 'package:flutter/material.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasSubscriptions = true; // Replace with actual logic

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
        // Conditionally render the sorting dropdown
        if (hasSubscriptions)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Sort:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButton<String>(
                    value: 'All',
                    onChanged: (String? newValue) {},
                    items: <String>[
                      'All',
                      'Active',
                      'Inactive',
                      'Newest',
                      'Oldest'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(), // Remove the default underline
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: hasSubscriptions
              ? const SubscriptionsListWidget() // Replace with your actual widget for displaying subscriptions
              // ignore: dead_code
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/shareappicn.png"),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 30),
                      const Text("Oops!"),
                      const Text("You have no subscriptions yet"),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Type()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        ),
                        child: const Text(
                          "Create a Subscription",
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

class SubscriptionsListWidget extends StatelessWidget {
  const SubscriptionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1, // Replace with actual number of subscriptions
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SubscriptionDetails()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3 months Subscription",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Single Trash Bag",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Organic Rubbish",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Active",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.green)),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ManageSubscriptions()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.manage_search, size: 15),
                                  Text("Manage",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              children: [
                                Icon(Icons.refresh, size: 15),
                                Text("Renew", style: TextStyle(fontSize: 10)),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              children: [
                                Icon(Icons.delete_outline, size: 15),
                                Text("Delete", style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text("GHC 312",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))
                      ])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
