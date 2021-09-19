import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:thanawy_programming/lib/shared/components/components.dart';

class Telmez extends StatelessWidget {
  const Telmez({Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {

    final BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );
    final BannerAdListener listener = BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    );
    myBanner.load();

    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        Image(
          image: NetworkImage(
            "https://image.freepik.com/free-photo/cheerful-young-kid-standing-pointing-hello-spring_171337-16317.jpg"),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*1,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){myBanner.load();}, child: Text("AD")),
            defaultButton(context: context,
                 url: "https://eleveprimaire.education.tn/authentification/index.php"
               ,text: "إبتدائي",
              width: MediaQuery.of(context).size.width*0.5,
              radius: 20,background:Colors.grey.shade100 ,isUpperCase: true,
            ),
            SizedBox(height: 8,),

            defaultButton(context: context,
              url: "https://elevescollege.education.tn/authentification/index.php"
               ,text: "إعدادي",width: MediaQuery.of(context).size.width*0.5,radius: 20,background:Colors.grey.shade100 ,isUpperCase: true,
            ),
            SizedBox(height: 8,),
            defaultButton(context: context,
                url: "https://eleveslycee.education.tn/authentification/index.php"
              ,text: "ثانوي",width: MediaQuery.of(context).size.width*0.5,radius: 20,background:Colors.grey.shade100 ,isUpperCase: true,
            ),

          ],),
        )
      ],
    );
  }
}
class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw new UnsupportedError("Unsupported platform");
  }
}

