//
//  FirstTableViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/2/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit
import NotificationCenter
import RealmSwift
import SwipeCellKit


class FirstTableViewController: UITableViewController {
    enum Constants {
        static var isSecondLaunch = "isSecondLaunch"
    }
    var refresh = UIRefreshControl()
    var quoteProvider: QuoteProvider?
    var address = "https://api.coinmarketcap.com/v1/ticker"
    var quotes: [QuoteRealSw] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //User defaults
              if UserDefaults.standard.bool(forKey: Constants.isSecondLaunch) == false {
                  print(" Первый запуск")
                  UserDefaults.standard.set(true, forKey: Constants.isSecondLaunch)
                  //меняем ключ на диске
              } else {
                  print("Не первый запуск")
              }
        

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadQuotes))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        tableView.refreshControl = refresh
        tableView.refreshControl?.addTarget(self, action: #selector(loadQuotes), for: .valueChanged)
        quoteProvider = QuoteProvider()
        NotificationCenter.default.addObserver(self, selector: #selector(loadQuotes), name: .init("tableDataSource"), object: nil)
       getDataFromRealm()
       title = "Криптовалюты"
    }


    
    // работа с сетью
    @objc func loadQuotes() {
       // print("Method loadQoutes was called")
            QuoteFetchManager.shared.fetchQuotes(url: address) { [weak self] quotes in
                       guard let self = self else { return }
                       self.quotes = quotes
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
            }
      
       
        self.tableView.refreshControl?.endRefreshing()
    }
    
    //Realm
    func getDataFromRealm() {
        let quotes = QuoteManager.readFromRealm()
        if quotes.isEmpty {
            //print("isEmpty")
            QuoteFetchManager.shared.fetchQuotes(url: address) { [weak self] quotes in
                       guard let self = self else { return }
                       self.quotes = quotes
                for element in quotes {
                    QuoteManager.saveQuote(quote: element)
                }
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
            }
        } else {
            self.quotes = quotes
            // print("NOtisEmpty")
            
        }
        
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCellIdentifier", for: indexPath) as! QuoteCell

        let quote = quotes[indexPath.row]
        cell.nameLabel.text = quote.name
        
        cell.priceLabel.text = quote.price_usd
        cell.symbolLabel.text = quote.symbol
        cell.ImageOutlet.image = UIImage(named: quote.id)
        cell.delegate = self
       
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
           guard segue.identifier == "toDetail" else {
               return
           }
           if let quoteDetail = segue.destination as? DetailViewController {
               if let cell = sender as? QuoteCell {
                   if let indexPath = tableView.indexPath(for: cell) {
                       let quote = quotes[indexPath.row]
                       quoteDetail.quote = quote
                    
                   }
               }
           }
       }

    
    

    
}


extension FirstTableViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {

        let deleteAction = SwipeAction(style: .destructive,
                                       title: "Delete") { (action, indexPath) in
                                        self.quotes.remove(at: indexPath.row)
                                        self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
 
        return [deleteAction]
    }
}
