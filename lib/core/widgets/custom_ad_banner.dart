import 'package:bntu_schedule/core/utils/ad_mob_service.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CustomAdBanner extends StatefulWidget {
  const CustomAdBanner({
    super.key,
    this.adSize = AdSize.banner,
  });

  final AdSize adSize;

  @override
  State<CustomAdBanner> createState() => _CustomAdBannerState();
}

class _CustomAdBannerState extends State<CustomAdBanner> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isAdLoaded
        ? Container(
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd),
            color: Colors.green,
          )
        : const SizedBox();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: AdMobService.bannerAdId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          sl<Talker>().error('$ad: $error');
        },
      ),
      request: const AdRequest(),
    )..load();
  }
}
