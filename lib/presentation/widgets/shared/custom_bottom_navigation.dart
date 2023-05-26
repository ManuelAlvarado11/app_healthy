import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
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
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'MuseoSans',
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
        color: AppColors.primary,
      ),
      onTap: (value) => onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Page 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Page 3',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Page 4',
        )
      ],
    );
  }
}
