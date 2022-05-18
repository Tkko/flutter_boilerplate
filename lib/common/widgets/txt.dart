import 'package:flutter_boilerplate/app/app.dart';

class Txt extends StatelessWidget {
  final String? text;
  final TextStyle style;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? translate;

  const Txt._(
    this.text, {
    required this.style,
    this.maxLines,
    this.textAlign,
    this.translate = true,
    Key? key,
  }) : super(key: key);

  const Txt.body(
    String? text, {
    TextStyle? style,
    int? maxLines,
    TextAlign? textAlign,
    bool? translate,
    Key? key,
  }) : this._(
          text,
          style: style ?? const TextStyle(fontSize: 16),
          maxLines: maxLines,
          textAlign: textAlign,
          translate: translate,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final safeText = text ?? '';
    final shouldTranslate = translate ?? true;

    return Text(
      shouldTranslate ? context.tr(text) : safeText,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}
