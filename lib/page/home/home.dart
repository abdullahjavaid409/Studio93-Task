import 'package:task/all_utils.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        action: [
          IconButton(
              onPressed: _pressedMenu,
              icon: const Icon(Icons.more_horiz, color: AppColor.blackColor))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: const Column(
          children: [
            HomeCard(),
          ],
        ),
      ),
    );
  }

  void _pressedMenu() {}
}
