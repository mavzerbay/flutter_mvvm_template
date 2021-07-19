import '../../../core/extensions/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();

  final ideation = "ideation".toSVG;
  final hiking = "hiking".toSVG;
  final mobile = "mobile".toSVG;
}
