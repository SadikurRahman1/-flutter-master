import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/exported_files/exported_file.dart';


class ResponsiveImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit fit;
  final BoxShape shape;
  final double borderRadius;
  final Color? color;

  const ResponsiveImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.size,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 0.0,
    this.color,
  });

  bool get _isNetwork => path.startsWith('http');
  bool get _isSVG => path.toLowerCase().endsWith('.svg');

  bool get _isFile {
    try {
      return File(path).existsSync();
    } catch (_) {
      return false;
    }
  }

  double get _width => size ?? width ?? 50;
  double get _height => size ?? height ?? 50;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_isSVG) {
      // SVG image
      if (_isNetwork) {
        imageWidget = SvgPicture.network(
          path,
          width: _width,
          height: _height,
          fit: fit,
          colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          placeholderBuilder: (_) => _buildShimmerPlaceholder(),
        );
      } else if (_isFile) {
        imageWidget = SvgPicture.file(
          File(path),
          width: _width,
          height: _height,
          fit: fit,
          colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      } else {
        imageWidget = SvgPicture.asset(
          path,
          width: _width,
          height: _height,
          fit: fit,
          colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      }
    } else {
      // PNG/JPG image
      if (_isNetwork) {
        imageWidget = CachedNetworkImage(
          imageUrl: path,
          width: _width,
          height: _height,
          fit: fit,
          color: color,
          colorBlendMode: color != null ? BlendMode.srcIn : null,
          placeholder: (_, __) => _buildShimmerPlaceholder(),
          errorWidget: (_, __, ___) => _buildErrorWidget(),
        );
      } else if (_isFile) {
        imageWidget = Image.file(
          File(path),
          width: _width,
          height: _height,
          fit: fit,
          color: color,
          colorBlendMode: color != null ? BlendMode.srcIn : null,
          errorBuilder: (_, __, ___) => _buildErrorWidget(),
        );
      } else {
        imageWidget = Image.asset(
          path,
          width: _width,
          height: _height,
          fit: fit,
          color: color,
          colorBlendMode: color != null ? BlendMode.srcIn : null,
          errorBuilder: (_, __, ___) => _buildErrorWidget(),
        );
      }
    }

    // Shape / Border handling
    if (shape == BoxShape.circle) {
      return ClipOval(child: imageWidget);
    } else if (borderRadius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageWidget,
      );
    } else {
      return imageWidget;
    }
  }

  // 🔹 Shimmer while loading
  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }

  // 🔹 Error Widget
  Widget _buildErrorWidget() {
    return Container(
      width: _width,
      height: _height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(borderRadius)
            : null,
      ),
      child: Icon(
        Icons.broken_image_outlined,
        color: Colors.grey.shade500,
        size: _width * 0.4,
      ),
    );
  }
}
