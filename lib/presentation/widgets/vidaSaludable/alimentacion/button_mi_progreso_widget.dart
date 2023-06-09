import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class ButtonMiProgresoWidget extends StatelessWidget {
  final Widget? icon;
  final String? txtButton;
  final VoidCallback onPressed;

  const ButtonMiProgresoWidget({
    Key? key,
    this.icon,
    this.txtButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AlimentacionColors.backgorundCards,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            icon ?? Container(),
            const SizedBox(
              width: 10,
            ),
            Text(txtButton ?? ''),
          ],
        ),
      ),
    );
  }
}
