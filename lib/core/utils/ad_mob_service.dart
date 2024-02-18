import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdMobService {
  static String get bannerAdId {
    return kDebugMode
        ? dotenv.env['TEST_AD_BANNER_ID']!
        : dotenv.env['ANDROID_AD_BANNER_ID']!;
  }

  static String get interstitialAdId {
    return kDebugMode
        ? dotenv.env['TEST_AD_INTERSTITIAL_ID']!
        : dotenv.env['ANDROID_AD_INTERSTITIAL_ID']!;
  }
}
