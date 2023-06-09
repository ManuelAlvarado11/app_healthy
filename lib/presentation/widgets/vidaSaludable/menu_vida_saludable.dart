import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuVidaSaludable extends StatelessWidget {
  final String title;
  final String icon;
  final String img;
  final Color colorBanner;
  final GestureTapCallback? onTap;

  const MenuVidaSaludable({
    super.key,
    required this.title,
    required this.icon,
    required this.img,
    required this.colorBanner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 30.0, right: 30.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 125,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
                Container(
                  width: size.width,
                  color: colorBanner.withOpacity(0.70),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon,
                        height: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'MuseoSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
