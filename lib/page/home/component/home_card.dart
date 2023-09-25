import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final bool isEdit;
  final List<MealProduct> mealProduct;
  final BuildContextCallback? addPressedCallBack;
  final BuildContextCallback? editPressed;
  final BuildContextCallback? savePressed;
  const HomeCard(
      {super.key,
      required this.title,
      this.addPressedCallBack,
      this.isEdit = false,
      this.mealProduct = const [],
      this.editPressed,
      this.savePressed});

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
                            'Meal One'.toText(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                            const VerticalSpacing(of: 5),
                            mealProduct.isNotEmpty
                                ? !isEdit
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
                                        fontSize: 12.sp)),
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
                                      CalculationTile(product: e),
                                      const Divider(
                                        color: Colors.white,
                                        thickness: 2,
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
          onPressed: addPressedCallBack,
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

class CalculationTile extends StatelessWidget {
  final MealProduct product;
  const CalculationTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        product.productItemName.toText(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: AppColor.textColor,
            overflow: TextOverflow.ellipsis),
        const Spacer(),
        Row(
          children: [
            '${product.price} Cals'.toText(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: AppColor.lightBlackColor),
            IconButton(
                padding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                onPressed: _pressedCancel,
                icon: const Icon(Icons.cancel, size: 18)),
          ],
        )
      ],
    );
  }

  void _pressedCancel() {}
}

class TotalCalculate extends StatelessWidget {
  final List<MealProduct> productList;
  const TotalCalculate({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        'Total'.toText(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: AppColor.saveColor,
            overflow: TextOverflow.ellipsis),
        const Spacer(),
        '${productList.fold(0.0, (double currentSum, MealProduct product) => currentSum + product.price)} Cals'
            .toText(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: AppColor.saveColor),
        const HorizontalSpacing(of: 32),
      ],
    );
  }
}
