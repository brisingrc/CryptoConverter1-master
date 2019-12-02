//
//  QuoteFetchManager.swift
//  CryptoConverter
//
//  Created by Мак on 11/20/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import Alamofire
class QuoteFetchManager {
    private init(){}
    
    static let shared = QuoteFetchManager()
    
    func fetchQuotes(url: String, completionHandler: @escaping ([QuoteRealSw]) -> ()) {
        guard let url = URL(string: url) else { //why optional? -> мб некорректное имя сервера
               return
           }//completionHandler = closure = функция которая передается как параметр
        request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return }
            if (200...300).contains(statusCode) {
                guard let data = response.data else { return }
                //print(data)
                if let quotes = try? JSONDecoder().decode([QuoteRealSw].self, from: data)
                {
                        //print(quotes)
                        completionHandler(quotes)
                    
                }
            }
        }    }
}
