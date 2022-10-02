import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:get/get.dart';

import '../../../general/constants/url.dart';

class ProductController extends GetxController {
  RxList productsList = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthController authController = Get.put(AuthController());
  //GlobalKey<CarouselSliderState> sliderKey = GlobalKey();

  @override
  onInit() {
    getProducts();
    productsSnapshot();
    super.onInit();
  }

  getProducts() async {
    var response = await firestore.collection(Urls.PRODUCTS_COLLECTION).get();
    productsMap(response);
  }

  productsMap(QuerySnapshot<Map<String, dynamic>> response) async {
    var list = response.docs
        .map(
          (e) => ProductModel(
            id: e.id,
            productName: e['productName'],
            category: e['category'],
            price: e['price'],
            quantity: e['quantity'],
            discountPrice: e['discountPrice'],
            discription: e['discription'],
            image: e['image'],
            totalSell: e['totalSell'],
          ),
        )
        .toList();
    productsList.value = list;
  }

  productsSnapshot() {
    firestore.collection(Urls.PRODUCTS_COLLECTION).snapshots().listen(
      (response) {
        productsMap(response);
      },
    );
  }

  RxDouble productPercentage = 0.0.obs;
  //RxDouble one = 0.0.obs;
  calculatePercentage(double discountPrice, double currentPrice) {
    productPercentage.value = 100 - ((discountPrice / currentPrice) * 100);
    return productPercentage.value;
  }

  void addProducts() {
    var id = authController.auth.currentUser!.uid;
    var productName = 'Coriander Leaves (Dhonia Pata) ± 10 gm bhjg';
    var category = 'gjr';
    var price = '9500';
    var quantity = '65';
    var discountPrice = '8500';
    var discription = 'erg';
    var image =
        'https://chaldn.com/_mpimage/coriander-leaves-dhonia-pata-10-gm-100-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D28562&q=low&v=1&m=400&webp=1';
    var totalSell = '18';

    addProduct(
      id,
      productName,
      category,
      price,
      quantity,
      discountPrice,
      discription,
      image,
      totalSell,
    );
  }

  addProduct(String id, productName, category, price, quantity, discountPrice,
      discription, image, totalSell) {
    var item = ProductModel(
      id: id,
      productName: productName,
      category: category,
      price: price,
      quantity: quantity,
      discountPrice: discountPrice,
      discription: discription,
      image: image,
      totalSell: totalSell,
    );
    firestore.collection(Urls.PRODUCTS_COLLECTION).add(item.toJson());
  }

  deleteItem(String id) {
    firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).delete();
  }
}