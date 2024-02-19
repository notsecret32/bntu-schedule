import 'package:bntu_schedule/core/utils/ad_mob_service.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CustomAdInterstitial {
  CustomAdInterstitial() {
    createInterstitialAd();
  }

  late InterstitialAd? _interstitialAd;

  Future<void> createInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) => _interstitialAd = ad,
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          sl<Talker>().error('$_interstitialAd: $error');
        },
      ),
    );
  }

  Future<void> show() async {
    if (_interstitialAd == null) {
      await createInterstitialAd();
    }

    _interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback<InterstitialAd>(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        sl<Talker>().error('$ad: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void dispose() {
    _interstitialAd!.dispose();
  }
}
