import 'package:task/all_utils.dart';
import 'package:task/models/meal.dart';
import 'package:task/providers/meal.dart';

class AddProductDialog extends StatefulWidget {
  final Meal meal;
  const AddProductDialog({super.key, required this.meal});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final formValidateKey = GlobalKey<FormState>();

  @override
  void dispose() {
    priceController.dispose();
    productNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formValidateKey,
      child: Dialog(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              'Add Product'.toText(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center),
              const VerticalSpacing(of: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Product Name is Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(color: AppColor.lightBlackColor),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor))),
                controller: productNameController,
              ),
              const VerticalSpacing(of: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Price is Required';
                  }
                  return null;
                },
                controller: priceController,
                decoration: const InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: AppColor.lightBlackColor),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.lightBlackColor))),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const VerticalSpacing(of: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.lightBlackColor),
                onPressed: () => _addProductPressed(context),
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addProductPressed(BuildContext context) {
    if (formValidateKey.currentState!.validate()) {
      final mealProvider = context.read<MealProvider>();
      mealProvider.addMeal(
          widget.meal,
          MealProduct(
              productItemName: productNameController.text.trim(),
              price: double.parse(priceController.text.trim())));
      Navigator.of(context).pop();
    }
  }
}
