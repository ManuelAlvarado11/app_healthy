// ignore_for_file: must_be_immutable

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    Key? key,
    this.colorButton,
    this.colorTxt,
    required this.txtButton,
    this.fontsize = 16,
    required this.onPressed,
    this.onLongPressed,
    this.isEnabled = true,
    this.isTextButton = false,
    this.paddingButton = 20.0,
    this.marginButton = 10.0,
    this.padding,
    this.elevation = 0,
    this.fontWeight = FontWeight.w500,
    this.isCenterText = false,
  }) : super(key: key);

  Color? colorButton;
  Color? colorTxt;
  final String txtButton;
  double fontsize;
  final VoidCallback? onPressed;
  VoidCallback? onLongPressed;
  bool isEnabled;
  bool isTextButton;
  double paddingButton;
  double marginButton;
  EdgeInsets? padding;
  double elevation;
  FontWeight fontWeight;
  bool isCenterText;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : null,
      onLongPress: widget.isEnabled ? widget.onLongPressed : null,
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
