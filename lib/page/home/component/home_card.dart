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
                height: 0.101.sh,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: data.isNotEmpty
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
                        ),
                        const HorizontalSpacing(of: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            'Meal One'.toText(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                            const VerticalSpacing(of: 5),
                            data.isNotEmpty
                                ? isEdit
                                    ? Row(
                                        children: [
                                          HomeContainer(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            height: 20,
                                            border: Border.all(
                                                color: AppColor.blackColor),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            width: 55,
                                            child: 'Edit'.toText(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp),
                                          ),
                                          const HorizontalSpacing(of: 10),
                                          const Icon(
                                            Icons.bookmark_border,
                                          )
                                        ],
                                      )
                                    : HomeContainer(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        height: 22,
                                        border: Border.all(
                                            color: AppColor.saveColor),
                                        borderRadius: BorderRadius.circular(12),
                                        width: 55,
                                        child: 'Save'.toText(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.saveColor,
                                            fontSize: 12.sp),
                                      )
                                : HomeContainer(
                                    color: AppColor.blackColor.withOpacity(0.3),
                                    alignment: Alignment.center,
                                    height: 22,
                                    borderRadius: BorderRadius.circular(12),
                                    width: 90,
                                    child: 'No Product'.toText(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 12.sp)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            data.isNotEmpty
                ? const SizedBox()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: AppColor.backGroundColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.separated(
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          primary: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return const CalculationTile();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Colors.white,
                              thickness: 2,
                            );
                          },
                        ))),
          ],
        ),
        HomeContainer(
          onPressed: addPressedCallBack,
          iconData: Icons.add,
          color: AppColor.blackColor,
          width: 51,
          height: 61,
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
      dense: true,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      title: 'Spicy Bacon Cheese Toast'.toText(
          fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    );
  }
}
