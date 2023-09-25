import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';
import 'package:task/page/home/component/calculation_title.dart';
import 'package:task/providers/meal.dart';

class HomeCard extends StatelessWidget {
  final Meal mealItem;
  final BuildContextCallback? plusCallBack;
  final BuildContextCallback? editPressed;
  const HomeCard(
      {super.key, this.plusCallBack, this.editPressed, required this.mealItem});

  @override
  Widget build(BuildContext context) {
    final mealProduct = mealItem.mealProduct;
    final isSave = mealItem.isEdit;
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
                        HomeContainer(
                          width: 55,
                          height: 55,
                          iconData: mealItem.productIcon,
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
                                ? Row(
                                    children: [
                                      HomeContainer(
                                        onPressed: editPressed,
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        height: !isSave ? 20 : 22,
                                        border: Border.all(
                                            color: AppColor.borderColor),
                                        borderRadius: BorderRadius.circular(12),
                                        width: 55 ,
                                        child: (!isSave ? 'Edit' : 'Save')
                                            .toText(
                                                fontWeight: FontWeight.w600,
                                                color: !isSave
                                                    ? null
                                                    : AppColor.saveColor,
                                                fontSize: 12.sp),
                                      ),
                                      const HorizontalSpacing(of: 10),
                                      !isSave
                                          ? const Icon(
                                              Icons.bookmark_border,
                                              color: AppColor.borderColor,
                                            )
                                          : const SizedBox(),
                                    ],
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
                                          isEdit: isSave,
                                          onPressed: (context) =>
                                              deletePressed(context, e)),
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

  void deletePressed(BuildContext context, MealProduct mealProduct) {
    if (!mealItem.isEdit) {
      final provider = context.read<MealProvider>();
      provider.deleteMeal(mealItem, mealProduct);
    }
  }
}
