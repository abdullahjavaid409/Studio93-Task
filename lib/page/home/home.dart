import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';
import 'package:task/page/home/component/add_product_dialog.dart';
import 'package:task/providers/meal.dart';

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
                  plusCallBack: (context) => _pressedAdd(context, meals[index]),
                  mealItem: meals[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const VerticalSpacing(of: 10);
              },
            );
          },
        ));
  }

  void _pressedMenu() {}

  void _pressedAdd(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (context) => AddProductDialog(meal: meal),
    );
  }
}
