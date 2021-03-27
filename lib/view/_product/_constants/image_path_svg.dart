import '../../../core/extensions/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths _instance;
  static SVGImagePaths get instance {
    if (_instance == null) _instance = SVGImagePaths._init();
    return _instance;
  }

  SVGImagePaths._init();


  final ideation = "ideation".toSVG;
  final hiking = "hiking".toSVG;
  final mobile = "mobile".toSVG;
}

