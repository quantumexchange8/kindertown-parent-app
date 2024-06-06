import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';

List<Map<String, dynamic>> stepItems = [
  {
    'text': 'Reserve a seat in kindergarten',
    'image': 'assets/images/reserve_a_seat_image.png',
  },
  {
    'text': 'Join using Invitation code',
    'image': 'assets/images/join_using_code_image.png',
  },
  {
    'text': 'Join as a KinderTown Affiliate',
    'image': 'assets/images/join_as_affiliate_image.png',
  },
];

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageBackground(
        child: Column(
          children: [
            TitleColumn(
                title: 'Hello!', description: 'Tell us about your next step.'),
          ],
        ),
      ),
    );
  }
}
