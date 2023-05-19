import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final void Function()? onPressed;
  final String txtButton;
  final double fontsize;
  final Color? colorButton;
  final Color? colorTxt;
  final bool isEnabled;
  final bool isTextButton;
  final double paddingButton;
  final double marginButton;
  final EdgeInsets? padding;
  final double elevation;
  final FontWeight fontWeight;
  final bool isCenterText;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.txtButton,
    required this.fontsize,
    this.colorButton,
    this.colorTxt,
    this.isEnabled = true,
    this.isTextButton = false,
    this.paddingButton = 20.0,
    this.marginButton = 10.0,
    this.padding,
    this.elevation = 0,
    this.fontWeight = FontWeight.w500,
    this.isCenterText = false,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : null,
      child: Material(
        elevation: widget.isTextButton ? 0 : widget.elevation,
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: widget.isTextButton
                ? Colors.white
                : widget.isEnabled
                    ? widget.colorButton ?? AppColors.primary
                    : AppColors.greyLight100,
          ),
          child: Padding(
            padding: widget.padding ??
                const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 35,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.isCenterText,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.txtButton,
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontSize: widget.fontsize,
                        fontWeight: widget.fontWeight,
                        color: widget.colorTxt ??
                            (widget.isTextButton == true
                                ? AppColors.primary
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !widget.isCenterText,
                  child: Text(
                    widget.txtButton,
                    style: TextStyle(
                      fontFamily: 'MuseoSans',
                      fontSize: widget.fontsize,
                      fontWeight: widget.fontWeight,
                      color: widget.colorTxt ??
                          (widget.isTextButton == true
                              ? AppColors.primary
                              : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
