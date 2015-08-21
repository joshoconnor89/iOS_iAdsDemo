//
//  ViewController.swift
//  iAdDemo
//
//  Created by Kristian Secor on 4/1/15.
//  Copyright (c) 2015 Kristian Secor. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    var rectangleAdView:ADBannerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        //check iCloud
        self.canDisplayBannerAds = true
        //this allows you to choose:
        rectangleAdView = ADBannerView(adType: ADAdType.Banner)
        rectangleAdView?.delegate = self
    }
        
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
    self.view.addSubview(banner)
    self.view.layoutIfNeeded()
    }
    
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.view.removeFromSuperview()
        self.view.layoutIfNeeded()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as UIViewController
        destination.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Automatic
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

