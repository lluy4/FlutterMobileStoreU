import 'package:e_commerce_flutter/utility/snack_bar_helper.dart';
import 'package:e_commerce_flutter/utility/utility_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cart/flutter_cart.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/product.dart';


class ProductDetailProvider extends ChangeNotifier {
  final DataProvider _dataProvider;
  String? selectedVariant;
  var flutterCart = FlutterCart();

  ProductDetailProvider(this._dataProvider);

  //TODO: should complete addToCart
  void addToCart(Product  product){
    if(product.proVariantId!.isNotEmpty && selectedVariant == null){
      SnackBarHelper.showErrorSnackBar("Hãy chọn loại");
      return;
    }
    double? price = product.offerPrice != product.price ? product.offerPrice : product.price;
    flutterCart.addToCart(
        cartModel: CartModel(
            productId: '${product.sId}',
            productName: '${product.name}',
            productImages: ['${product.images.safeElementAt(0)?.url}'],
            variants: [ProductVariant(price: price ?? 0 ,color: selectedVariant)],
            productDetails: '${product.description}'),
    );
    selectedVariant = null;
    SnackBarHelper.showSuccessSnackBar('thêm thành công');
    notifyListeners();
  }


  void updateUI() {
    notifyListeners();
  }
}
