import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainPageController extends GetxController {
  var currentIndex = 2.obs;
  var currentPage = 1.obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }

  //late InterstitialAd interstitialAd;
  late BannerAd bannerAd;
  //bool isIntLoaded = false;
  bool isAdLoaded = false;

  // void initAdd() {
  //   InterstitialAd.load(
  //     adUnitId: 'ca-app-pub-3940256099942544/1033173712',
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: onAdLoaded,
  //       onAdFailedToLoad: (error) {
  //         isIntLoaded = true;
  //       },
  //     ),
  //   );
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initBannerAdd();
    // initAdd();
  }

  _initBannerAdd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          bannerAd.load();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  // void onAdLoaded(InterstitialAd ad) {
  //   interstitialAd = ad;
  //   isIntLoaded = true;

  //   interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdDismissedFullScreenContent: (ad) {
  //       interstitialAd.dispose();
  //       isIntLoaded = true;
  //     },
  //     onAdFailedToShowFullScreenContent: (ad, error) {
  //       interstitialAd.dispose();
  //       isIntLoaded = true;
  //     },
  //   );
  // }
}
