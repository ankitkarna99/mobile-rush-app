import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';

class KCard extends StatelessWidget {
  final Widget? trailing;
  final Widget? action;
  final String title;
  final String heading;
  final String subHeading;
  final List<Widget> children;
  final bool negative;
  final bool noPadding;
  final Color background;
  final CrossAxisAlignment crossAxisAlignment;

  bool get noHeading => heading == "";
  bool get noTitle => title == "";

  const KCard({
    this.children = const [mHeightSpan],
    this.title = "",
    this.heading = "",
    this.subHeading = "",
    this.negative = false,
    this.trailing,
    this.action,
    this.noPadding = false,
    this.background = Colors.white,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: noPadding ? null : AppDimens.cardPadding,
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: AppDimens.cardBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!noTitle)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: KHeadline(
                        title,
                        overflow: TextOverflow.ellipsis,
                        size: HeadlineSize.small,
                      ),
                    ),
                    Row(
                      children: [
                        mWidthSpan,
                        if (action != null) action!,
                      ],
                    ),
                  ],
                ),
                sHeightSpan,
                if (!noHeading)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                KHeadline(
                                  heading,
                                  size: HeadlineSize.large,
                                ),
                                sWidthSpan,
                                KHeadline(
                                  subHeading,
                                  size: HeadlineSize.xSmall,
                                  color: negative ? errorColor : successColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      if (trailing != null) trailing!,
                    ],
                  ),
              ],
            ),
          Column(
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          )
        ],
      ),
    );
  }
}
