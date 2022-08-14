import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_button.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:first_app/widgets/k_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({Key? key}) : super(key: key);

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  bool hasAccepted = true;
  bool loading = false;
  String currentPassword = "";

  final _formKey = GlobalKey<FormState>();

  Future<void> forgotPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });

        await Future.delayed(const Duration(milliseconds: 600));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'You will soon receive an email containing the instructions to reset your password.',
          )),
        );

        Navigator.pop(context);
      } catch (err) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: bodyColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: AppDimens.pagePadding,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  lHeightSpan,
                  Card(
                    color: secondaryColor,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: KHeadline(
                        "FORGOT PASSWORD",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              lHeightSpan,
              mHeightSpan,
              KTextFormField(
                label: "Email",
                validator: (email) {
                  return RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(email!)
                      ? null
                      : "Please use a valid email.";
                },
              ),
              sHeightSpan,
              KButton(
                isBusy: loading,
                child: const Text("Send Forgot Password Request"),
                onPressed: () {
                  forgotPassword();
                },
              ),
              mHeightSpan,
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Accidentally here?',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pop(),
                          text: ' Sign In',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
