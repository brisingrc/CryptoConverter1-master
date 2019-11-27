//
//  SelectTableViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/10/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

protocol array {
    func dataTransfer(array:QuoteRealSw)
}

enum QuotesSelected {
    case from
    case to
}
class SelectTableViewController: UITableViewController {
    
    var btnSetImageDelegate: ButtonImageDelegate?
    var address = "https://api.coinmarketcap.com/v1/ticker"
    var quoteCurrency: QuotesSelected = .from
    var quoteProvider: QuoteProvider?
    
    var fromOne: [QuoteRealSw] = [] {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       quoteProvider = QuoteProvider()
              NotificationCenter.default.addObserver(self, selector: #selector(loadQuotes), name: .init("tableDataSource"), object: nil)
              loadQuotes()
             
    }
    

    @objc func loadQuotes() {
        guard let url = URL(string: address) else { //why optional? -> мб некорректное имя сервера
            return
        }//completionHandler = closure = функция которая передается как параметр
        let dataTask = URLSession.shared.dataTask(with: url) {
            [weak self]
            (data, response, error) in
            if let data = data {//данные пришли - бинарные данные с сервера
                //data -> (JSON -> Quote) //try - обработка исключений
             print(data)
                if let fromOne = try? JSONDecoder().decode([QuoteRealSw].self, from: data)
                 { //parse data->
                     print(fromOne)
                    self?.fromOne = fromOne
                }
             
            }
        }
        dataTask.resume() //делаем запрос
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fromOne.count
    }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 72.0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! SelectTableViewCell

         let quote = fromOne[indexPath.row]
        cell.symbolLabel.text = quote.name
         cell.imageView?.image = UIImage(named: quote.id)
         
         
         
         return cell
     }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("didSelectMethod was called")
        let selectedQuote: QuoteRealSw = fromOne[indexPath.row]
        
        print("")
                if quoteCurrency == .from {
                    btnSetImageDelegate?.setBtnImage(image: UIImage(named: selectedQuote.id))
                    btnSetImageDelegate?.baseQuote = selectedQuote
            
        }
        if quoteCurrency == .to {
                  btnSetImageDelegate?.setSecondImage(image: UIImage(named: selectedQuote.id))
                  btnSetImageDelegate?.quote = selectedQuote
              }

           dismiss(animated: true, completion: nil)
       }
}
