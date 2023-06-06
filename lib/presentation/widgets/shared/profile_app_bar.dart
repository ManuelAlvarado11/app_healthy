import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class ProfileAppBar extends StatelessWidget {
  final VoidCallback? onPressedIconButtonRight;
  final Color colorLineaHorizontal;
  final Color? colorProfilePicture;
  final String iconButtonRight;
  final Widget? iconProfile;
  final bool isBackButtonVisible;
  final bool showIconProfile;
  final bool isHome;

  const ProfileAppBar({
    super.key,
    this.onPressedIconButtonRight,
    this.colorLineaHorizontal = AppColors.primary,
    this.iconButtonRight = "assets/svg/campana.svg",
    this.colorProfilePicture,
    this.iconProfile,
    this.showIconProfile = true,
    this.isBackButtonVisible = false,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 38,
            child: Center(
              child: Visibility(
                visible: isBackButtonVisible,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.blueDark,
                  onPressed: () {
                    context.canPop()
                        ? context.pop()
                        : context.go('${PagesScreen.routeName}/0');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Hola User",
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                        color: AppColors.greyDark,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorLineaHorizontal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isHome) {
                          context.go('/pages-screen/3');
                        } else {
                          context.go('/pages-screen/0');
                        }
                      },
                      child: ProfilePicture(
                        size: 70.0,
                        borderSize: 2.0,
                        borderColor:
                            colorProfilePicture ?? colorLineaHorizontal,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Visibility(
                      visible: showIconProfile,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Material(
                            elevation: 3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            color: AppColors.greyLight90,
                            child: GestureDetector(
                              onTap: onPressedIconButtonRight,
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  // vertical: 6.0,
                                ),
                                child: Center(
                                  child: iconProfile ??
                                      SvgPicture.asset(
                                        iconButtonRight,
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
