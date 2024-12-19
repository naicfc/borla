import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
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
          left: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 350,
              padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(50),
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
                    title: const Text('Dashboard',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 1'),
                  ),
                  ListTile(
                    title: const Text('My Request History',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 2'),
                  ),
                  ListTile(
                    title: const Text('How To',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                  ListTile(
                    title: const Text('Buy Borla credits',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                  ListTile(
                    title: const Text('Support',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => _onItemSelected(context, 'Item 3'),
                  ),
                  ListTile(
                    title: const Text('About',
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
    _hideOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showOverlay(context),
      child: SvgPicture.asset(
        'assets/icons/menu.svg', // Your SVG icon path
        width: 50.0,
        height: 40.0,
        // ignore: deprecated_member_use
        color: Colors.green, // Icon color
      ),
    );
  }
}
