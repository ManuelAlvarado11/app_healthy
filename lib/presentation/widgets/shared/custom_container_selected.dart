import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainerSelected extends StatelessWidget {
  final String txtSelected;
  final Color? colorFill;
  final double? fontsize;

  const CustomContainerSelected({
    Key? key,
    required this.txtSelected,
    this.colorFill,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(15);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: const BorderRadius.only(
          topLeft: borderRadius,
          bottomLeft: borderRadius,
          bottomRight: borderRadius,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(txtSelected,
            style: TextStyle(
              color: colorFill,
              fontSize: fontsize,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
