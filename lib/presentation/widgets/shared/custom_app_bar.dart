import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final String? title;
  final VoidCallback? onPressed;
  final double elevation;

  const CustomAppBar({
    super.key,
    this.color = AppColors.primary,
    this.title,
    this.onPressed,
    this.elevation = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
        child: AppBar(
          title: Text(
            title ?? '',
            style: const TextStyle(
              fontFamily: 'MuseoSans',
              fontWeight: FontWeight.w700,
              fontSize: 22.0,
              color: AppColors.greyDark,
            ),
          ),
          elevation: elevation,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.1, 0.0],
                  colors: <Color>[color, AppColors.white]),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: color,
            ),
            onPressed:
                onPressed ?? () => context.canPop() ? context.pop() : null,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
