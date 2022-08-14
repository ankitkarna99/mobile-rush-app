import 'package:first_app/constants/app_dimens.dart';
import 'package:first_app/constants/ui_helpers.dart';
import 'package:first_app/themes/app_themes.dart';
import 'package:first_app/widgets/k_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final String? errorText;
  final List<TextInputFormatter>? formatters;

  final Widget? prefixIcon, suffixIcon;
  final bool takeCheckSpace;

  const KTextFormField(
      {this.takeCheckSpace = false,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.hint,
      this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.initialValue,
      this.errorText,
      this.formatters,
      Key? key})
      : super(key: key);

  @override
  _KTextFormFieldState createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  /// Since custom positioning of default error message was not possible,
  /// this new errorText state variable was created to custom show the validation
  String? errorText;

  /// A checkmark is need to be shown in the TextFormField once the interaction has started
  /// and the validation is error free. This boolean state variable keeps track of whether the interaction has begun or not
  bool interacted = false;

  /// Obscure Text is used for passwords.
  /// This variable needs to be toggled whenever, show/hide state of password is to be toggled.
  late bool obscureText;

  _KTextFormFieldState();

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;
    setState(() {
      obscureText = widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: KHeadline(
                  widget.label!,
                  size: HeadlineSize.xSmall,
                ),
              ),
              sHeightSpan,
            ],
          ),
        TextFormField(
          inputFormatters: widget.formatters,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,

            /// For passwords, we need a toggle icon instead of the checkmark,
            /// so we show the toggle buttons as a first priority, then the checkmark.
            suffixIcon: widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: darkGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      )
                    : (widget.suffixIcon != null)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.suffixIcon != null) widget.suffixIcon!,
                              if (widget.suffixIcon != null &&
                                  widget.hint != "Search")
                                mWidthSpan,
                              // if ((interacted && errorText == null) ||
                              //     widget.takeCheckSpace)
                              //   Icon(
                              //     Icons.check,
                              //     color: (interacted && errorText == null)
                              //         ? secondaryColor
                              //         : Colors.transparent,
                              //   ),
                              if (widget.suffixIcon != null &&
                                  widget.hint != "Search")
                                mWidthSpan,
                            ],
                          )
                        : (interacted && errorText == null)
                            ? const Icon(
                                Icons.check,
                                color: secondaryColor,
                              )
                            : null
                : null,
            errorStyle: const TextStyle(
              height: 0,
              fontSize: 0,
            ),
            enabledBorder: (interacted && errorText == null)
                ? Theme.of(context).inputDecorationTheme.focusedBorder
                : null,
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          /// Since, default styling for the errorText was not appropriate,
          /// the validator is called manually inside of onChanged and the state variables are updated.
          onChanged: (value) {
            if (widget.validator != null) {
              setState(() {
                errorText = widget.validator!(value);
                interacted = true;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        if (errorText != null)
          Column(
            children: [
              sHeightSpan,
              Text(
                errorText ?? "",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).errorColor,
                      fontSize: AppDimens.headlineFontSizeXXSmall,
                    ),
              ),
            ],
          )
      ],
    );
  }
}
