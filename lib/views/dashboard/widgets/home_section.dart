import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_card.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppDimens.pagePadding,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            sHeightSpan,
            const Divider(),
            sHeightSpan,
            const KHeadline(
              "Award-winning digital agency",
              size: HeadlineSize.medium,
              fontWeight: FontWeight.w600,
              center: true,
            ),
            lHeightSpan,
            Row(
              children: [
                Expanded(
                  child: KCard(
                    background: primaryColor,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_projects_list.png",
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                      ),
                      sHeightSpan,
                      const KHeadline(
                        "3400+",
                        fontWeight: FontWeight.w600,
                        center: true,
                      ),
                      xsHeightSpan,
                      const Text(
                        "Projects Delivered",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                mWidthSpan,
                Expanded(
                  child: KCard(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    background: primaryColor,
                    children: [
                      Image.asset(
                        "assets/ic_developers.png",
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                      ),
                      sHeightSpan,
                      const KHeadline(
                        "180+",
                        fontWeight: FontWeight.w600,
                        center: true,
                      ),
                      xsHeightSpan,
                      const Text(
                        "Developers",
                        textAlign: TextAlign.center,
                      ),
                      mHeightSpan,
                      xsHeightSpan,
                    ],
                  ),
                ),
              ],
            ),
            mHeightSpan,
            Row(
              children: [
                Expanded(
                  child: KCard(
                    background: primaryColor,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ic_years_tick.png",
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                      ),
                      sHeightSpan,
                      const KHeadline(
                        "15+",
                        fontWeight: FontWeight.w600,
                        center: true,
                      ),
                      xsHeightSpan,
                      const Text(
                        "Years in Operation",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                mWidthSpan,
                Expanded(
                  child: KCard(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    background: primaryColor,
                    children: [
                      Image.asset(
                        "assets/ic_happy.png",
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                      ),
                      sHeightSpan,
                      const KHeadline(
                        "68+",
                        fontWeight: FontWeight.w600,
                        center: true,
                      ),
                      xsHeightSpan,
                      const Text(
                        "International Awards",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            lHeightSpan,
            KCard(
              background: cardGrey,
              children: [
                KHeadline("About EB Pearls"),
                Divider(),
                Text(
                    "EB Pearls is a full-service digital agency based in Sydney. We help you connect with your customers and grow your business with creative, results-driven websites and mobile applications."),
              ],
            )
          ],
        ),
      ],
    );
  }
}
