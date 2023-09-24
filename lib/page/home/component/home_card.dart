import 'package:task/all_utils.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final bool isEdit;
  final List<String> data;
  final BuildContextCallback? addPressedCallBack;
  const HomeCard(
      {super.key,
      this.title = 'Meal One',
      this.addPressedCallBack,
      this.isEdit = false,
      this.data = const []});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            ClipPath(
              clipper: RightCornerClipper(),
              child: Container(
                height: 0.1.sh,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: data.isEmpty
                      ? BorderRadius.circular(12)
                      : const BorderRadius.only(topLeft: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const HomeContainer(
                          width: 55,
                          height: 55,
                          iconData: Icons.sunny,
                          size: 15,
                        ),
                        const HorizontalSpacing(of: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            'Meal One'.toText(
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                            const VerticalSpacing(of: 10),
                            isEdit
                                ? Row(
                                    children: [
                                      HomeContainer(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        height: 20,
                                        border: Border.all(
                                            color: AppColor.blackColor),
                                        borderRadius: BorderRadius.circular(12),
                                        width: 55,
                                        child: 'Edit'.toText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp),
                                      ),
                                      const HorizontalSpacing(of: 10),
                                      const Icon(
                                        Icons.bookmark_border,
                                        size: 18,
                                      )
                                    ],
                                  )
                                : HomeContainer(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    height: 20,
                                    border:
                                        Border.all(color: AppColor.saveColor),
                                    borderRadius: BorderRadius.circular(12),
                                    width: 55,
                                    child: 'Save'.toText(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.saveColor,
                                        fontSize: 12.sp),
                                  ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            data.isEmpty
                ? const SizedBox()
                : Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const CalculationTile()),
          ],
        ),
        HomeContainer(
          onPressed: addPressedCallBack,
          iconData: Icons.add,
          color: AppColor.blackColor,
          width: 51,
          height: 61,
          size: 17,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(8),
              topLeft: Radius.circular(4),
              bottomRight: Radius.circular(4)),
          iconColor: AppColor.backGroundColor,
        ),
      ],
    );
  }
}

class CalculationTile extends StatelessWidget {
  const CalculationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: 'Spicy Bacon Cheese Toast 312 Cals'.toText(),
    );
  }
}
