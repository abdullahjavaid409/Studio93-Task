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
                                        onPressed: savePressed,
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
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: AppColor.backGroundColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.separated(
                          itemCount: mealProduct.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 5.h),
                          primary: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return CalculationTile(product: mealProduct[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
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
  final MealProduct product;
  const CalculationTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        product.productItemName.toText(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            overflow: TextOverflow.ellipsis),
        const Spacer(),
        Row(
          children: [
            '${product.price} Cals'.toText(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: ),
            IconButton(
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
