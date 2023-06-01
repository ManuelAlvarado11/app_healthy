import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class ProfilePicture extends StatelessWidget {
  final Color borderColor;
  final double borderSize;
  final double size;

  const ProfilePicture({
    Key? key,
    this.borderColor = AppColors.radioButtonIconSelected,
    this.borderSize = 4.0,
    this.size = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor,
            width: borderSize,
          ),
          borderRadius: BorderRadius.circular(size),
        ),
        padding: EdgeInsets.all(borderSize),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: FadeInImage(
              height: size,
              width: size,
              image: const NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
              placeholder: const AssetImage('assets/img/no-image.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
