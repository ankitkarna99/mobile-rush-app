import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/views/contact/contact_view.dart';
import 'package:first_app/views/dashboard/constants/projects.dart';
import 'package:first_app/widgets/k_button.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectView extends StatelessWidget {
  final ProjectModel project;
  const ProjectView({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: bodyColor,
        elevation: 0,
        title: Text(project.name),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/bg_baxta_banner.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            padding: AppDimens.pagePaddingX,
            children: [
              SizedBox(
                height: 225,
                child: PageView(
                  children: [
                    Hero(
                      tag: project.image,
                      child: Image.asset(project.image, fit: BoxFit.cover),
                    ),
                    Image.asset(project.image, fit: BoxFit.cover),
                  ],
                ),
              ),
              mHeightSpan,
              Text(project.description),
              mHeightSpan,
              KHeadline(
                "Client:",
                size: HeadlineSize.xSmall,
                fontWeight: FontWeight.w600,
              ),
              xxsHeightSpan,
              Text(project.client),
              xxsHeightSpan,
              KHeadline(
                "Industry:",
                size: HeadlineSize.xSmall,
                fontWeight: FontWeight.w600,
              ),
              xxsHeightSpan,
              Text(project.industry),
              xxsHeightSpan,
              KHeadline(
                "Project Type:",
                size: HeadlineSize.xSmall,
                fontWeight: FontWeight.w600,
              ),
              xxsHeightSpan,
              Text(project.projectType),
              mHeightSpan,
              const KHeadline(
                "Technology Used",
                fontWeight: FontWeight.w600,
              ),
              sHeightSpan,
              SizedBox(
                height: 86,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: project.technologies
                      .map<Widget>((technology) => Container(
                            height: 86,
                            margin: const EdgeInsets.only(right: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  technology.image,
                                  height: 60,
                                ),
                                xsHeightSpan,
                                KHeadline(
                                  technology.name,
                                  size: HeadlineSize.xSmall,
                                  center: true,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              mHeightSpan,
              const KHeadline(
                "Website:",
                fontWeight: FontWeight.w600,
              ),
              sHeightSpan,
              InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(project.link))) {
                    throw 'Could not launch ${project.link}';
                  }
                },
                child: Text(
                  project.link,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              mHeightSpan,
              KButton(
                  child: Text("Contact"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactView()));
                  }),
              lHeightSpan,
            ],
          ),
        ],
      ),
    );
  }
}
