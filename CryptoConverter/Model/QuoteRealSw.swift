//
//  QuoteRealm.swift
//  CryptoConverter
//
//  Created by Мак on 11/21/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteRealSw: Object, Decodable {
@objc dynamic var id = ""
@objc dynamic var name = ""
@objc dynamic var symbol = ""
@objc dynamic var rank = ""
@objc dynamic var price_usd = ""
@objc dynamic var price_btc = ""
@objc dynamic var market_cap_usd = ""
@objc dynamic var total_supply = ""
@objc dynamic var percent_change_1h = ""
@objc dynamic var percent_change_24h = ""
@objc dynamic  var percent_change_7d = ""
@objc dynamic var last_updated = ""

}
//var id: String
//   var name: String
//   var symbol: String
//   var rank: String
//   var price_usd: String
//   var price_btc: String
//   //var h_volume_usd: String
//   var market_cap_usd: String
//   var available_supply: String
//   var total_supply: String
//   //var max_supply: String
//   var percent_change_1h: String
//   var percent_change_24h: String
//   var percent_change_7d: String
//   var last_updated: String  //  здесь поменял из даты на стринг
//   var image : String?
