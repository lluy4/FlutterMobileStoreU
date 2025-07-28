import '../../utility/extensions.dart';
import 'package:flutter/material.dart';
import '../../utility/app_color.dart';
import '../../widget/custom_text_field.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.profileProvider.retrieveSavedAddress();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Địa chỉ của tôi",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.darkOrange),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: context.profileProvider.addressFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            labelText: 'Số Điện thoại',
                            onSave: (value) {},
                            inputType: TextInputType.number,
                            controller: context.profileProvider.phoneController,
                            validator: (value) => value!.isEmpty ? 'Nhập số điện thoại' : null,
                          ),
                          CustomTextField(
                            labelText: ' số nhà',
                            onSave: (val) {},
                            controller: context.profileProvider.streetController,
                            validator: (value) => value!.isEmpty ? 'Nhập số nhà̉' : null,
                          ),
                          CustomTextField(
                            labelText: 'Thành phố',
                            onSave: (value) {},
                            controller: context.profileProvider.cityController,
                            validator: (value) => value!.isEmpty ? 'Nhập thành phố' : null,
                          ),
                          CustomTextField(
                            labelText: 'Quận',
                            onSave: (value) {},
                            controller: context.profileProvider.stateController,
                            validator: (value) => value!.isEmpty ? 'Nhập Quận' : null,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  labelText: 'Mã bưu điện',
                                  onSave: (value) {},
                                  inputType: TextInputType.number,
                                  controller: context.profileProvider.postalCodeController,
                                  validator: (value) => value!.isEmpty ? 'Nhập mã bưu điện' : null,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextField(
                                  labelText: 'Quốc tịch',
                                  onSave: (value) {},
                                  controller: context.profileProvider.countryController,
                                  validator: (value) => value!.isEmpty ? 'Quốc tịch' : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.darkOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        if (context.profileProvider.addressFormKey.currentState!.validate()) {
                          context.profileProvider.storeAddress();
                        }
                      },
                      child: const Text('Chỉnh sửa địa chỉ', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
