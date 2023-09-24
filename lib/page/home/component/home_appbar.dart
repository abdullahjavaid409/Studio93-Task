import 'package:task/all_utils.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  final List<Widget>? action;
  final String title;
  final Widget? leading;
  final Size? appBarSize;
  final Widget? appBarChild;

  const HomeAppBar({
    Key? key,
    this.title = 'Meals',
    this.action,
    this.leading,
    this.appBarSize,
    this.appBarChild,
  }) : super(key: key);

  @override
  Size get preferredSize => appBarSize ?? Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      title: title.toText(fontWeight: FontWeight.bold, fontSize: 18.sp),
      actions: action,
    );
  }

  @override
  Widget get child => appBarChild ?? const SizedBox();
}
