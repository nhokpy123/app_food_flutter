import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtt/controllers/cart_controller.dart';
import 'package:testtt/data/reponsitory/popular_product_repo.dart';
import 'package:testtt/models/cart_model.dart';

import '../models/product_model.dart';
import '../utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("Ngon");

      _popularProductList = (response.body as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();

      _isLoaded = true;
      update();
    } else {
      print("Ga");
    }
  }


  void setQuality(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      //print("Number of items " +_quatity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      //print("decrement "+_quatity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "con dau ma doi giam??",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "nhieu qua roi, dung an nua! ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print("exist or not "+exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print("The quantity in the cart is "+ _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _inCartItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
