import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/constants/environment.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomCardContentWidget extends StatelessWidget {
  final dynamic contenido;
  final int tipo;

  const CustomCardContentWidget({
    Key? key,
    required this.contenido,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          switch (tipo) {
            case 2:
              break;
            case 3:
              break;
            case 4:
              break;
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: [
                    CachedNetworkImageWidget(
                      src: tipo == 4 || tipo == 17
                          ? "https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(contenido.urlVideo ?? "")}/0.jpg"
                          : "${Environment.apiUrl}/files?path=${contenido.banner}",
                      height: tipo == 4 ? 200 : 125,
                      width: size.width,
                      radius: 25,
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: tipo != 4 && tipo != 17,
                            child: Container(
                              height: 125,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.4),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  tipo == 5
                                      ? contenido.nombre
                                      : contenido.titulo,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'MuseoSans',
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: tipo == 4 || tipo == 17,
                            child: Center(
                              child: Container(
                                height: tipo == 17 ? 50 : 70,
                                width: tipo == 17 ? 50 : 70,
                                decoration: BoxDecoration(
                                  color: tipo == 17
                                      ? EjercicioColors.secondary
                                      : SaludBucalColors.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: tipo == 17 ? 50 : 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: tipo == 19,
                      child: const Positioned(
                        left: 20.0,
                        bottom: 7.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.access_time_filled,
                              color: AppColors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'data',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  tipo == 5 ? contenido.nombre : contenido.titulo,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: "MuseoSans",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
