import 'package:task/all_utils.dart';
import 'package:task/providers/meal.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MealProvider(),
      child: Scaffold(
          appBar: HomeAppBar(
            action: [
              IconButton(
                  onPressed: _pressedMenu,
                  icon: const Icon(Icons.more_horiz,
                      color: AppColor.lightBlackColor))
            ],
          ),
          body: Consumer<MealProvider>(
            builder: (context, provider, child) {
              final meals = provider.meals;
              return ListView.separated(
                itemCount: meals.length,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                itemBuilder: (context, index) {
                  return HomeCard(
                    mealItem: meals[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const VerticalSpacing(of: 10);
                },
              );
            },
          )),
    );
  }

  void _pressedMenu() {}
}
