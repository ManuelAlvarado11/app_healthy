import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final Widget? icon;
  final bool obscureText;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool isSwicth;
  final double? width;

  final String? hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? listTextInputFormatter;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.label,
    this.icon,
    this.obscureText = false,
    this.backgroundColor,
    this.labelColor,
    this.isSwicth = false,
    this.width,
    this.hint,
    this.errorMessage,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.listTextInputFormatter,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = false;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 50.0,
            width: widget.width ?? 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.backgroundColor ?? AppColors.greyLight,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: widget.isSwicth ? 0 : 20),
                    child: Center(
                      child: TextFormField(
                        keyboardType: widget.keyboardType ?? TextInputType.text,
                        inputFormatters: widget.listTextInputFormatter,
                        controller: widget.controller,
                        obscureText: isObscure,
                        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: widget.icon,
                          iconColor: widget.labelColor,
                          hintText: widget.hint ?? '',
                          label: Text(widget.label ?? ''),
                          labelStyle: TextStyle(
                            color: widget.labelColor,
                            fontSize: 14,
                          ),
                          suffixIcon: widget.obscureText
                              ? IconButton(
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    isObscure = !isObscure;
                                    setState(() {});
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Error message
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.errorMessage ?? "",
              style: const TextStyle(
                fontFamily: 'MuseoSans',
                color: AppColors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
