import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyMeals = Meal.dummyMeals;
    return Scaffold(
        appBar: HomeAppBar(
          action: [
            IconButton(
                onPressed: _pressedMenu,
                icon: const Icon(Icons.more_horiz,
                    color: AppColor.lightBlackColor))
          ],
        ),
        body: ListView.separated(
          itemCount: dummyMeals.length,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          itemBuilder: (context, index) {
            return HomeCard(
              mealItem: dummyMeals[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const VerticalSpacing(of: 10);
          },
        ));
  }

  void _pressedMenu() {}
}
