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
    @objc func updateTimer() {
        NotificationCenter.default.post(name: .init("tableDataSource") , object: nil)
    }
}

