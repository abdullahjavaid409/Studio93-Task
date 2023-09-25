import 'package:task/all_utils.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: of.h,
      );
}

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of.w,
    );
  }
}

class RightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.85, size.height * 0.75);
    path.lineTo(size.width * 0.85, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HomeContainer extends StatelessWidget {
  final IconData? iconData;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final double width;
  final BuildContextCallback? onPressed;
  final double? size;
  final Widget? child;
  final Color? iconColor;
  final Alignment? alignment;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final Color? color;
  const HomeContainer(
      {super.key,
      this.iconData,
      this.width = 60,
      this.height = 60,
      this.alignment,
      this.color,
      this.size,
      this.iconColor = AppColor.lightBlackColor,
      this.borderRadius,
      this.child,
      this.onPressed,
      this.boxShadow,
      this.padding,
      this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed == null ? null : () => onPressed!(context),
      child: Container(
        width: width.w,
        padding: padding,
        height: height.h,
        alignment: alignment,
        decoration: BoxDecoration(
            boxShadow: boxShadow,
            border: border,
            color: color ?? AppColor.backGroundColor,
            borderRadius: borderRadius ?? BorderRadius.circular(12)),
        child: child ??
            Icon(
              iconData,
              size: size ?? 17,
              color: iconColor,
            ),
      ),
    );
  }
}
