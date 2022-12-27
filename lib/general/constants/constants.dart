import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';

import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/authPage/controller/login_page_controller.dart';
import 'package:digital_shop/apps/authPage/controller/signup_page_controller.dart';
import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/categoryPage/controller/category_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_history_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/mainPage/controller/main_page_controller.dart';
import 'package:digital_shop/apps/productDetailsPage/controller/product_details_page_controller.dart';
import 'package:digital_shop/apps/productPage/controller/product_controller.dart';
import 'package:digital_shop/apps/checkoutPage/controller/checkout_page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

AccountPageController accountPageController = AccountPageController.instance;
AuthController authController = AuthController.instance;
LoginPageController loginPageController = LoginPageController.instance;
SignUpPageController signUpPageController = SignUpPageController.instance;
CartPageController cartPageController = CartPageController.instance;
CategoryPageController categoryPageController = CategoryPageController.instance;
BuyPageController buyPageController = BuyPageController.instance;
ExchangePageController exchangePageController = ExchangePageController.instance;
SellHistoryController sellHistoryController = SellHistoryController.instance;
SellPageController sellPageController = SellPageController.instance;
HomePageController homePageController = HomePageController.instance;
MainPageController mainPageController = MainPageController.instance;
AddressPageController addressPageController = AddressPageController.instance;

ProductDetailsPageController productDetailsPageController =
    ProductDetailsPageController.instance;
ProductController productController = ProductController.instance;
CheckoutPageController checkoutPageController = CheckoutPageController.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseMessaging messaging = FirebaseMessaging.instance;
GetStorage storage = GetStorage();
FirebaseAuth auth = FirebaseAuth.instance;
Logger logger = Logger();
