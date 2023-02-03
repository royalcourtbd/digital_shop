import 'package:digital_shop/apps/mainPage/model/google_ads_model.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class MainPageController extends GetxController {
  static MainPageController instance = Get.find();
  Rx<GoogleAdsModel?> googleAdsModel = GoogleAdsModel().obs;
  var currentIndex = 2.obs;
  //var currentPage = 1.obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }

  late InterstitialAd interstitialAd;
  late BannerAd bannerAd;
  bool isIntLoaded = false;
  bool isAdLoaded = false;

  @override
  void onReady() {
    _initBannerAdd();
    initAdd();
    authController.user.value != null
        ? accountPageController.getUserInfo()
        : null;
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getAdsUnitID();
    _initBannerAdd();

    initAdd();
  }

  getAdsUnitID() async {
    try {
      firestore
          .collection(Urls.SettingsCollection)
          .doc('adsUnitId')
          .snapshots()
          .listen((event) {
        googleAdsModel.value = GoogleAdsModel.fromJson(event.data()!);
        _initBannerAdd();
        initAdd();
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  _initBannerAdd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      // adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      adUnitId: googleAdsModel.value!.banner1 == null
          ? ''
          : googleAdsModel.value!.banner1!,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isAdLoaded = true;
        },
        onAdClicked: (ad) {},
        onAdFailedToLoad: (ad, error) {
          bannerAd.load();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  void initAdd() {
    InterstitialAd.load(
      //adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      adUnitId: googleAdsModel.value!.interstitial1 == null
          ? ''
          : googleAdsModel.value!.interstitial1!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {
          isIntLoaded = true;
        },
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    isIntLoaded = true;

    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        interstitialAd.dispose();
        isIntLoaded = true;
        initAdd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        interstitialAd.dispose();
        isIntLoaded = true;
        initAdd();
      },
    );
  }
}
