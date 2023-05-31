import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          backgroundColor: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(widget.text));
  }
}
