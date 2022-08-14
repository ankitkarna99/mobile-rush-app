import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';

class IncompleteSection extends StatelessWidget {
  final String title;
  const IncompleteSection({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          lHeightSpan,
          KHeadline(
            title,
            center: true,
          ),
          const Divider(),
          const Text(
            "This is work in progress.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
