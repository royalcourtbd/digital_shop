import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:get/get.dart';

import '../../../general/constants/url.dart';

class ProductController extends GetxController {
  RxList productsList = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
              totalSell: e['totalSell']),
        )
        .toList();
    productsList.value = list;
  }

  productsSnapshot() {
    firestore
        .collection(Urls.PRODUCTS_COLLECTION)
        .snapshots()
        .listen((response) {
      productsMap(response);
    });
  }

  void addProducts() {
    var id = 'ffg';
    var productName = 'fhsjk';
    var category = 'gjr';
    var price = '12.56';
    var quantity = 'erg';
    var discountPrice = '653.56';
    var discription = 'erg';
    var image = 'https://cdn.somahar.xyz/product/0OCYaBb5Lwv5H5dEaWgM4035.jpg';
    var totalSell = 'gre';

    addItem(
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

    //Get.toNamed(RoutesClass.getSellHistoryPageRoute());
  }

  addItem(String id, productName, category, price, quantity, discountPrice,
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
