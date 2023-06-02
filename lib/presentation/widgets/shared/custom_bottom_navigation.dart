// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('${PagesScreen.routeName}/0');
        break;
      case 1:
        context.go('${PagesScreen.routeName}/1');
        break;
      case 2:
        context.go('${PagesScreen.routeName}/2');
        break;
      case 3:
        context.go('${PagesScreen.routeName}/3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      elevation: 10,
      fixedColor: AppColors.primary,
      selectedFontSize: 12,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'MuseoSans',
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      ),
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      onTap: (value) => onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/inicio.svg',
            height: 40.0,
            width: 40.0,
            color:
                currentIndex == 0 ? AppColors.primary : AppColors.greyLight100,
          ),
          label: 'Page 1',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/img/Expediente.png',
            height: 40.0,
            width: 40.0,
            color:
                currentIndex == 1 ? AppColors.primary : AppColors.greyLight100,
          ),
          label: 'Page 2',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/vida_saludable.svg',
            height: 40.0,
            width: 40.0,
            color:
                currentIndex == 2 ? AppColors.primary : AppColors.greyLight100,
          ),
          label: 'Page 3',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/configuracion.svg',
            height: 40.0,
            width: 40.0,
            color:
                currentIndex == 3 ? AppColors.primary : AppColors.greyLight100,
          ),
          label: 'Page 4',
        )
      ],
    );
  }
}
