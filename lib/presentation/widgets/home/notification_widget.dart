import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.color,
    this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget? icon;
  final Color? color;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: widget.color ?? AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: SizedBox(
          width: 90,
          height: 135,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon ?? const SizedBox(),
              const SizedBox(height: 20),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
