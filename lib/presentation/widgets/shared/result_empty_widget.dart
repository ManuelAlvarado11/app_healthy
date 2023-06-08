import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class ResultEmptyWidget extends StatefulWidget {
  final String urlImagen;
  final String mensajeVacio;

  const ResultEmptyWidget({
    Key? key,
    required this.urlImagen,
    required this.mensajeVacio,
  }) : super(key: key);

  @override
  State<ResultEmptyWidget> createState() => _ResultEmptyWidgetState();
}

class _ResultEmptyWidgetState extends State<ResultEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: SvgPicture.asset(
              "assets/svg/vacio_alimentacion.svg",
              height: 240,
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.mensajeVacio,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "MuseoSans",
                  fontSize: 12,
                  color: AppColors.greyDark),
            ),
          ],
        ),
      ),
    );
  }
}
