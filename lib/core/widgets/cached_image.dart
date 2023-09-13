import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/shimmer_widget.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double radius;
  const CachedImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      imageBuilder: (_, imageProvider) => Container(
        height: Config.y(height),
        width: Config.x(width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => ShimmerWidget(
        child: Container(
          height: Config.y(height),
          width: Config.x(width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.dividerColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: Config.y(height),
        width: Config.x(width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: const DecorationImage(
              image: AssetImage('assets/images/school.jpg'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
