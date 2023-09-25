import 'package:task/all_utils.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
