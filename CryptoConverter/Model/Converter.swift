//
//  Converter.swift
//  CryptoConverter
//
//  Created by Мак on 10/31/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation



class Converter {
    var baseQuote: QuoteRealSw

    init(baseQuote: QuoteRealSw) {
        self.baseQuote = baseQuote
    }

    static func convertQuote(amount: Double, convertQuote: QuoteRealSw, baseQuote: QuoteRealSw)-> String{
        let result = amount * Double(convertQuote.price_usd)! / Double(baseQuote.price_usd)!
        let string = String(format: "%.2f", result)
        return string
    }
//   static func convertBackQuote(amount: Double, convertQuote: Quote, baseQuote: Quote)-> String{
//       let result = amount * Double(convertQuote.price_usd)! / Double(baseQuote.price_usd)!
//       let string = String(format: "%.2f", result)
//       return string
//   }

}
