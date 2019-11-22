//
//  Quote.swift
//  CryptoConverter
//
//  Created by Мак on 10/31/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
//"id": "bitcoin",
//       "name": "Bitcoin",
//       "symbol": "BTC",
//       "rank": "1",
//       "price_usd": "8727.65972596",
//       "price_btc": "1.0",
//       "24h_volume_usd": "18978798406.2",
//       "market_cap_usd": "157503815976",
//       "available_supply": "18046512.0",
//       "total_supply": "18046512.0",
//       "max_supply": "21000000.0",
//       "percent_change_1h": "0.17",
//       "percent_change_24h": "-0.93",
//       "percent_change_7d": "-5.88",
//       "last_updated": "1573725393"
struct Images {
    var image: String
}
struct Quote: CustomStringConvertible, Decodable{
    
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var price_usd: String
    var price_btc: String
    //var h_volume_usd: String
    var market_cap_usd: String
    var available_supply: String
    var total_supply: String
    //var max_supply: String
    var percent_change_1h: String
    var percent_change_24h: String
    var percent_change_7d: String
    var last_updated: String  //  здесь поменял из даты на стринг
    var image : String?       //здесь поменял из юайимадж на стринг
    
    enum CodingKeys: String, CodingKey { //не обязательная штука
        case id
        case name
        case symbol
        case rank
        case price_usd
        case price_btc
        //case h_volume_usd = "24h_volume_usd"
        case market_cap_usd
        case available_supply
        case total_supply
        //case max_supply
        case percent_change_1h
        case percent_change_24h
        case percent_change_7d
        case last_updated
    }
  
        
    var description: String {
           return self.fullName
       }

       var fullName: String {
           return "Валюта:\(symbol) \(name),\(price_usd)" + "\n"
       }
    
    
    static func convertToString(_ yourArray: Array<Quote>) -> String {
        var string = ""
        for i in yourArray.indices{
            string += yourArray[i].name + ", " + String(format: "%.3f", yourArray[i].price_usd) + "\n"
        }
        return string
    }
    

}


