import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/views/dashboard/constants/projects.dart';
import 'package:first_app/views/project/project_view.dart';
import 'package:first_app/widgets/k_card.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:first_app/widgets/k_text_form_field.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String query = "";
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prjs = projects.where((project) {
      if (query.isEmpty) return true;
      if (project.name.toLowerCase().contains(query.toLowerCase()) ||
          project.description.toLowerCase().contains(query.toLowerCase())) {
        return true;
      } else {
        return false;
      }
    }).toList();
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: AppDimens.pagePaddingX,
      children: [
        KTextFormField(
          controller: myController,
          onChanged: (text) {
            setState(() {
              query = text;
            });
          },
          hint: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: query.isNotEmpty
              ? InkWell(
                  onTap: () {
                    setState(() {
                      query = "";
                    });
                    FocusScope.of(context).unfocus();
                    myController.clear();
                  },
                  child: Icon(Icons.cancel_outlined))
              : null,
        ),
        mHeightSpan,
        ListView.builder(
          shrinkWrap: true,
          itemCount: prjs.length,
          itemBuilder: (context, index) {
            final project = prjs[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectView(project: project),
                    ),
                  );
                },
                child: KCard(
                  noPadding: true,
                  children: [
                    Hero(
                      tag: project.image,
                      child: Image.asset(project.image),
                    ),
                    Container(
                        padding: mPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KHeadline(project.name),
                            Text(
                              project.category.toUpperCase(),
                              style: const TextStyle(
                                color: cursorColor,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          },
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
