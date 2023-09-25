import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';
import 'package:task/page/home/component/calculation_title.dart';

class HomeCard extends StatelessWidget {
  final Meal mealItem;
  final BuildContextCallback? plusCallBack;
  final BuildContextCallback? editPressed;
  final BuildContextCallback? savePressed;
  final BuildContextCallback? tilePressed;
  const HomeCard(
      {super.key,
      this.plusCallBack,
      this.editPressed,
      this.savePressed,
      this.tilePressed,
      required this.mealItem});

  @override
  Widget build(BuildContext context) {
    final mealProduct = mealItem.mealProduct;
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
                  borderRadius: mealProduct.isEmpty
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
                            mealItem.productTitle.toText(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                            const VerticalSpacing(of: 5),
                            mealProduct.isNotEmpty
                                ? !mealItem.isEdit
                                    ? Row(
                                        children: [
                                          HomeContainer(
                                            onPressed: editPressed,
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            height: 20,
                                            border: Border.all(
                                                color: AppColor.borderColor),
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
                                            color: AppColor.borderColor,
                                          )
                                        ],
                                      )
                                    : HomeContainer(
                                        onPressed: savePressed,
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        height: 22,
                                        border: Border.all(
                                            color: AppColor.borderColor),
                                        borderRadius: BorderRadius.circular(12),
                                        width: 55,
                                        child: 'Save'.toText(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.saveColor,
                                            fontSize: 12.sp),
                                      )
                                : HomeContainer(
                                    color: AppColor.lightBlackColor
                                        .withOpacity(0.3),
                                    alignment: Alignment.center,
                                    height: 22,
                                    borderRadius: BorderRadius.circular(12),
                                    width: 90,
                                    child: 'No Product'.toText(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
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
            mealProduct.isEmpty
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
                        padding: EdgeInsets.only(
                            left: 12.w, bottom: 20.h, top: 10.h),
                        decoration: BoxDecoration(
                            color: AppColor.backGroundColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(children: [
                          ...mealProduct
                              .map((e) => Column(
                                    children: [
                                      CalculationTile(
                                          product: e,
                                          isEdit: mealItem.isEdit,
                                          onPressed: tilePressed),
                                      const Divider(
                                        color: Colors.white,
                                        thickness: 1.2,
                                      ),
                                    ],
                                  ))
                              .toList(),
                          const VerticalSpacing(of: 5),
                          TotalCalculate(productList: mealProduct),
                        ]))),
          ],
        ),
        HomeContainer(
          onPressed: plusCallBack,
          iconData: Icons.add,
          color: AppColor.lightBlackColor,
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
