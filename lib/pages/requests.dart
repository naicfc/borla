import 'package:edlege/pages/requests/request_details.dart';
import 'package:flutter/material.dart';

class PendingRequests extends StatelessWidget {
  const PendingRequests({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasPendingRequests = true; // Replace with actual logic

    const List<RequestModel> sampleRequests = [
      RequestModel(
        title: 'Single Trash Bag',
        category: 'Organic Rubbish',
        status: 'Completed',
        date: '25/12/2024',
        price: 312.00,
      ),
      RequestModel(
        title: 'Double Trash Pickup',
        category: 'Mixed Rubbish',
        status: 'Pending',
        date: '26/12/2024',
        price: 450.50,
      ),
      RequestModel(
        title: 'Double Trash Pickup',
        category: 'Mixed Rubbish',
        status: 'Cancelled',
        date: '26/12/2024',
        price: 450.50,
      ),
    ];

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.green),
          padding: const EdgeInsets.all(16),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "My Request History",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Conditionally render the sorting dropdown
        if (hasPendingRequests)
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
          child: hasPendingRequests
              ? const RequestListWidget(
                  requests:
                      sampleRequests) // Replace with your actual widget for displaying subscriptions
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
                      const Text("You have no pending requests"),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RequestDetails()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        ),
                        child: const Text(
                          "Make a request",
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

class RequestModel {
  final String title;
  final String category;
  final String status;
  final String date;
  final double price;

  const RequestModel({
    required this.title,
    required this.category,
    required this.status,
    required this.date,
    required this.price,
  });
}

class RequestListWidget extends StatelessWidget {
  final List<RequestModel> requests;

  const RequestListWidget({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestDetails()),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(request.title,
                          style:
                              const TextStyle(fontWeight: FontWeight.normal)),
                      Text(request.category,
                          style:
                              const TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        request.status,
                        style:
                            TextStyle(color: _getStatusColor(request.status)),
                      )
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(request.date),
                        const SizedBox(height: 20),
                        Text("GHC ${request.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18))
                      ])
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to determine status color
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Color.fromARGB(255, 75, 156, 243);
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
