import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget _svgAsset({
  Key? key,
  required String asset,
  Size? size,
  Color? color,
}) {
  return SvgPicture.asset(
    asset,
    color: color,
    width: size?.width,
    height: size?.height,
    key: key,
  );
}

class Illustration {
  static const _path = 'assets';

  static Widget bug({
    Size? size,
    Color? color,
  }) {
    return _svgAsset(
      asset: '$_path/bug.svg',
      color: color,
      size: size,
    );
  }

  static Widget idea({
    Size? size,
    Color? color,
  }) {
    return _svgAsset(
      asset: '$_path/idea.svg',
      color: color,
      size: size,
    );
  }

  static Widget thought({
    Size? size,
    Color? color,
  }) {
    return _svgAsset(
      asset: '$_path/thought.svg',
      color: color,
      size: size,
    );
  }

  static Widget success({
    Size? size,
    Color? color,
  }) {
    return _svgAsset(
      asset: '$_path/success.svg',
      color: color,
      size: size,
    );
  }
}
