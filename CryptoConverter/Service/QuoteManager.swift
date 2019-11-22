//
//  QuoteManager.swift
//  CryptoConverter
//
//  Created by Мак on 11/21/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteManager: Object{
   static func saveQuote(quote:QuoteRealSw){
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(quote)
                print("Added to Realm")
                
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
   static func readFromRealm() -> [QuoteRealSw] {
        print("read from Realm")
        var quoteRealm : [QuoteRealSw] = []
        do {
            let realm = try Realm()
            print("read try")
            let result = realm.objects(QuoteRealSw.self)
            result.forEach { QuoteRealSw(value: $0)
                quoteRealm.append($0)
                print("added to quoteRealm")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    return quoteRealm
    }
    
}
