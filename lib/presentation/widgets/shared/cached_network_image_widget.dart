import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends ConsumerStatefulWidget {
  final String src;
  final double? height;
  final double? width;
  final double? radius;

  const CachedNetworkImageWidget({
    Key? key,
    required this.src,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  CachedNetworkImageWidgetState createState() =>
      CachedNetworkImageWidgetState();
}

class CachedNetworkImageWidgetState
    extends ConsumerState<CachedNetworkImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 0),
      child: CachedNetworkImage(
        useOldImageOnUrlChange: true,
        httpHeaders: {
          "Authorization":
              "Bearer ${ref.watch(authProvider).loginResponse?.token ?? ''}",
        },
        height: widget.height,
        width: widget.width,
        fit: BoxFit.cover,
        imageUrl: widget.src,
        placeholder: (context, url) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        },
        errorWidget: (context, url, error) {
          return Icon(
            Icons.error,
            color: Colors.red,
            size: (widget.height ?? 1) / 2,
          );
        },
      ),
    );
  }
}
