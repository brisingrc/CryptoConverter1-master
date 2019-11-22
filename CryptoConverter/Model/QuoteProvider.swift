//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Мак on 11/2/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import UIKit


class QuoteProvider {
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateTimer), userInfo: self, repeats: true)
    }
    
    func generateImages(count: Int) -> [Images] {
        let imageNameArray = [String]()
        var result: [Images] = []
        for i in 0...count {
            let  image = Images(image: imageNameArray[i])
            result.append(image)
        }
        return result
    }
    func generateQuotes() -> [Quote] {
      
        let symbols = ["BTC","ETH","LTC","BNB","XLM","XMR"]
        let names = ["Bitcoin","Etherium","Litecoin","Binance Coin","Stellar","Monero"]
        var images = [UIImage]()
        images = [UIImage(named: "btc.png")!,UIImage(named: "ETH.png")!, UIImage(named: "LTC.png")!,
        UIImage(named: "BNB.png")!, UIImage(named: "XLM.png")!, UIImage(named: "XMR.png")!
        ]
        var result: [Quote] = []
        print(result)

        return result
    }
    
    @objc func updateTimer() {
        NotificationCenter.default.post(name: .init("tableDataSource") , object: nil)
    }
}

