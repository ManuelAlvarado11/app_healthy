import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomSelectFormField extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? width;
  final String? hint;
  final String? errorMessage;
  final List<dynamic> items;

  const CustomSelectFormField({
    super.key,
    this.label,
    this.icon,
    this.backgroundColor,
    this.labelColor,
    this.width,
    this.hint,
    this.errorMessage,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: width ?? 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: backgroundColor ?? AppColors.greyLight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<dynamic>(
                onChanged: (dynamic newValue) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: icon,
                  iconColor: labelColor,
                  hintText: hint ?? '',
                  label: Text(label ?? ''),
                  labelStyle: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
                dropdownColor: AppColors.white,
                items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value.nombre,
                    child: Text(value.nombre),
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
              errorMessage ?? "",
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
