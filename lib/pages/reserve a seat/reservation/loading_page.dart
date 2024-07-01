import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/loading_animation.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class LoadingPage extends StatefulWidget {
  final VoidCallback onStartLoading;
  const LoadingPage({super.key, required this.onStartLoading});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    widget.onStartLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageBackground(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: height100),
            child: const PrimaryLoadingAnimation(),
          ),
        ),
      ),
    );
  }
}
