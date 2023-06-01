// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class FeelingButtonWidget extends StatefulWidget {
  const FeelingButtonWidget({
    Key? key,
    required this.idEmocion,
    this.isSelected = false,
    this.onTap,
    this.days,
    this.percentage,
  }) : super(key: key);
  final bool isSelected;
  final GestureTapCallback? onTap;
  final double? percentage;
  final int? days;
  final int idEmocion;

  @override
  State<FeelingButtonWidget> createState() => _FeelingButtonWidgetState();
}

class _FeelingButtonWidgetState extends State<FeelingButtonWidget> {
  final List<String> assets = [
    "assets/svg/alegre.svg",
    "assets/svg/triste.svg",
    "assets/svg/confundido.svg",
    "assets/svg/enojado.svg",
  ];

  final List<Color> colors = [
    AppColors.alegre,
    AppColors.primary,
    AppColors.radioButtonIconSelected,
    AppColors.enojado,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(20.0),
            color: AppColors.greyLight,
            child: SizedBox(
              height: 64,
              width: 64,
              child: Center(
                child: SvgPicture.asset(
                  assets[widget.idEmocion - 1],
                  color:
                      widget.isSelected ? colors[widget.idEmocion - 1] : null,
                ),
              ),
            ),
          ),
          Visibility(
            visible: (widget.percentage ?? 0) > 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "${widget.percentage?.toStringAsFixed(2)}%",
              ),
            ),
          ),
          Visibility(
            visible: (widget.days ?? 0) > 0,
            child: const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                'Dias: 0',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
