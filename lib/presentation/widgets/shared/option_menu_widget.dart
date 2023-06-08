import 'package:flutter/material.dart';

class OptionMenuWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final double fontSize;
  final Color fontColor;
  final GestureTapCallback? onTap;
  final bool isFavorito;

  const OptionMenuWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.fontSize = 10.0,
    this.fontColor = Colors.black,
    this.onTap,
    this.isFavorito = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFavorito ? () {} : onTap,
      child: Container(
        width: 65,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            const SizedBox(height: 10.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MuseoSans',
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
