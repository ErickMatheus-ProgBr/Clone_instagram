import 'package:flutter/material.dart';
import 'package:instagram_app/providers/post_provider.dart';

class NotesCarousel extends StatelessWidget {
  const NotesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
