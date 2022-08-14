import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_button.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:first_app/widgets/k_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hasAccepted = true;
  final _formKey = GlobalKey<FormState>();

  bool signingIn = false;

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          signingIn = true;
        });

        await Future.delayed(const Duration(milliseconds: 600));

        Navigator.pushReplacementNamed(context, "/home");
      } catch (err) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: AppDimens.pagePadding,
            children: [
              Column(
                children: [
                  elHeightSpan,
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
                        "SIGN IN",
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
              KTextFormField(
                label: "Password",
                obscureText: true,
                validator: (password) {
                  return password!.length >= 6
                      ? null
                      : "Please use a password of at least six characters.";
                },
              ),
              mHeightSpan,
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                        value: hasAccepted,
                        onChanged: (val) {
                          setState(() {
                            hasAccepted = val!;
                          });
                        }),
                  ),
                  RichText(
                    text: TextSpan(
                        text: ' I agree to the',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.of(context).pushNamed("/terms"),
                            text: ' Terms and Conditions',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
              sHeightSpan,
              KButton(
                  isBusy: signingIn,
                  child: const Text("Sign In"),
                  onPressed: () {
                    signIn();
                  }),
              mHeightSpan,
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/forgot");
                  },
                  child: const KHeadline(
                    "Forgot Password?",
                    size: HeadlineSize.xSmall,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              mHeightSpan,
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Not registered yet?',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.of(context).pushNamed("/signup"),
                          text: ' Sign Up',
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
