import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';

class CalculationTile extends StatelessWidget {
  final MealProduct product;
  final bool isEdit;
  final BuildContextCallback? onPressed;
  const CalculationTile(
      {super.key, required this.product, required this.isEdit, this.onPressed});

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
                onPressed: onPressed == null ? null : () => onPressed!(context),
                icon: Icon(!isEdit ? Icons.cancel : Icons.arrow_circle_right,
                    color: !isEdit
                        ? Colors.red.shade600
                        : AppColor.lightBlackColor,
                    size: 18)),
          ],
        )
      ],
    );
  }
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
