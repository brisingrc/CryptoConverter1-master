//
//  DetailViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/3/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabelTwo: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    var quote: QuoteRealSw?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
updateUI()
        
    }
    

   

}



extension DetailViewController {
    func updateUI()  {
        if let quote = quote {
                   //nameLabel.text = "\(quote.name)"
            nameLabelTwo.text = "name: \(quote.name)"
            title = quote.name
            //imageView.image = quote.image
            symbolLabel.text = "Symbol: \(quote.symbol)"
            priceLabel.text = "Price: \(quote.price_usd) $"
            marketLabel.text = "Market cap usd: \(quote.market_cap_usd)"
            //supplyLabel.text = "Available supply: \(quote.max_supply)"
           percentLabel.text = "percent change 7d: \(quote.percent_change_7d)"
            lastUpdated.text = "last updated \(quote.last_updated)"
            imageView?.image = UIImage(named: quote.id)
               }
        

    }
}
