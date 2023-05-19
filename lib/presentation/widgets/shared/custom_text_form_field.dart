import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final EdgeInsets? margin;
  final double? paddingwidth;
  final double? fontsize;
  final Color? color;
  final Color? colorFill;
  final bool isSwicth;
  final List<TextInputFormatter>? listTextInputFormatter;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.icon,
    this.margin,
    this.paddingwidth,
    this.fontsize,
    this.color,
    this.colorFill,
    this.isSwicth = false,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 50.0,
        width: widget.paddingwidth ?? 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.color ?? AppColors.greyLight,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: widget.isSwicth ? 0 : 20),
                child: Center(
                  child: TextFormField(
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    inputFormatters: widget.listTextInputFormatter,
                    controller: widget.controller,
                    obscureText: isObscure,
                    onChanged: widget.onChanged,
                    validator: widget.validator,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: widget.icon,
                      iconColor: widget.colorFill,
                      label: widget.label == null
                          ? null
                          : Text(widget.label ?? ''),
                      labelStyle: TextStyle(
                          color: widget.colorFill, fontSize: widget.fontsize),
                      hintText: widget.hint ?? '',
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
                      errorText: widget.errorMessage,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
