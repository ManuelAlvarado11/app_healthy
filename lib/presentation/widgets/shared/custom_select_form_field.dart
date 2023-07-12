import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomSelectFormField extends StatefulWidget {
  final String? label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? width;
  final String? hint;
  final String? errorMessage;

  const CustomSelectFormField({
    super.key,
    this.label,
    this.icon,
    this.backgroundColor,
    this.labelColor,
    this.width,
    this.hint,
    this.errorMessage,
  });

  @override
  State<CustomSelectFormField> createState() => _CustomSelectFormFieldState();
}

class _CustomSelectFormFieldState extends State<CustomSelectFormField> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: widget.width ?? 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.backgroundColor ?? AppColors.greyLight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField(
                onChanged: (String? newValue) {},
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
                ),
                dropdownColor: AppColors.white,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
