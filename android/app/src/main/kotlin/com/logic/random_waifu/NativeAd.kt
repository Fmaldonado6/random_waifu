package com.logic.random_waifu

import android.view.LayoutInflater
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class NativeAd(
    private val layoutInflater: LayoutInflater
) : GoogleMobileAdsPlugin.NativeAdFactory {


    override fun createNativeAd(
        nativeAd: NativeAd?,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_admob_banner_view,null) as NativeAdView
        val headLine = adView.findViewById<TextView>(R.id.ad_headline)
        val bodyView = adView.findViewById<TextView>(R.id.ad_advertiser)

        nativeAd?.let {
            headLine.text = it.headline
            bodyView.text = it.body
            adView.setNativeAd(it)
            adView.bodyView = bodyView
            adView.headlineView = headLine
        }
        return adView
    }
}