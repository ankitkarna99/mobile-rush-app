import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_button.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:first_app/widgets/k_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  var submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: bodyColor,
        elevation: 0,
        title: Text("Contact Us"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: AppDimens.pagePadding, children: [
          KTextFormField(
            label: "First Name *",
            validator: (text) {
              return text!.isNotEmpty ? null : "First name is required.";
            },
          ),
          mHeightSpan,
          KTextFormField(
            label: "Last Name",
          ),
          mHeightSpan,
          KTextFormField(
            label: "Email *",
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              return RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(email!)
                  ? null
                  : "Please use a valid email.";
            },
          ),
          mHeightSpan,
          KTextFormField(
            label: "Mobile Number *",
            keyboardType: TextInputType.phone,
            validator: (text) {
              return text!.isNotEmpty ? null : "Mobile number is required.";
            },
          ),
          mHeightSpan,
          Text(
              "For a FREE consultation, simply leave your details and we’ll contact you soon."),
          sHeightSpan,
          InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse("tel:02 8880 7857"))) {
                throw 'Could not launch tel:02 8880 7857';
              }
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/ic_telephone.png",
                  height: 36,
                ),
                mWidthSpan,
                KHeadline(
                  "02 8880 7857",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          mHeightSpan,
          KButton(
              isBusy: submitting,
              child: Text("Submit"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    submitting = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                      'Your details were sent. We will contact you soon.',
                    )),
                  );
                }
              })
        ]),
      ),
    );
  }
}
