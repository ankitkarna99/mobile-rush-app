import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/views/contact/contact_view.dart';
import 'package:first_app/views/dashboard/widgets/home_section.dart';
import 'package:first_app/views/dashboard/widgets/incomplete_section.dart';
import 'package:first_app/views/dashboard/widgets/projects_section.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 1;

  static const List<Widget> widgetOptions = <Widget>[
    HomeSection(),
    ProjectsSection(),
    IncompleteSection(title: "About Us"),
    IncompleteSection(title: "Our Team"),
    IncompleteSection(title: "Contact"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: bodyColor,
        elevation: 0,
        title: selectedIndex == 1 ? Text("Projects") : null,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(children: [
                mHeightSpan,
                Image.asset(
                  "assets/logo.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                sHeightSpan,
                const Divider(),
                ListTile(
                  textColor: Colors.blueAccent,
                  iconColor: Colors.blueAccent,
                  leading: Icon(Icons.home_outlined),
                  title: Text("Dashboard"),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("Contact Us"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ContactView()));
                  },
                ),
              ]),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Our Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alternate_email),
            label: 'Contact',
          ),
        ],
        backgroundColor: secondaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        onTap: (int index) {
          if (index == 4) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ContactView()));
          } else {
            setState(() {
              selectedIndex = index;
            });
          }
        },
      ),
      body: SafeArea(child: widgetOptions.elementAt(selectedIndex)),
    );
  }
}
