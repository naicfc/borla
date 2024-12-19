import 'package:flutter/material.dart';

class CustomUserMenu extends StatefulWidget {
  const CustomUserMenu({super.key});

  @override
  State<CustomUserMenu> createState() => _CustomUserMenuState();
}

class _CustomUserMenuState extends State<CustomUserMenu> {
  OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              _hideOverlay();
            },
          ),
        ),
        Positioned(
          top: 60,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)), // Border radius
                border: Border.all(
                  color: Colors.green, // Border color
                  width: 3, // Border width
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Edit Profile',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 1'),
                  ),
                  ListTile(
                    title: const Text('Saved Locations',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 2'),
                  ),
                  ListTile(
                    title: const Text('Subscriptions',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                  ListTile(
                    title: const Text('Notifications',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                  ListTile(
                    title: const Text('Sign Out',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onItemSelected(BuildContext context, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$item selected')),
    );
    _hideOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showOverlay(context),
      child: const Image(
        image: AssetImage('assets/images/personicn.png'),
        width: 50,
      ),
    );
  }
}
