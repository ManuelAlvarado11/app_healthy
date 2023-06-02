import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        ProfilePicture(
          borderColor: AppColors.primary,
          borderSize: 3,
          size: 150,
        ),
        Spacer(),
        SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombres',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              Text(
                "Usuario 1",
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Edad',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              Text(
                '24',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Localizacion',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              Text(
                "Ilopango, San salvador",
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'DUI',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
              Text(
                "05738525-7",
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
