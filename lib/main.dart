import 'package:task/all_screens.dart';
import 'package:task/all_utils.dart';
import 'package:task/providers/meal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const TaskScreen());
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => MealProvider(),
          child: MaterialApp(
            title: 'Task',
            themeMode: ThemeMode.light,
            theme: AppTheme.buildTheme(),
            initialRoute: HomePage.routeName,
            routes: routes,
          ),
        );
      },
    );
  }
}
