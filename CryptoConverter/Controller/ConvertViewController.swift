//
//  ConvertViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/9/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

protocol ButtonImageDelegate {
    var quote: Quote? { get set }
    var baseQuote: Quote? {get set}
    func setBtnImage(image: UIImage?)
    func setSecondImage(image: UIImage?)
}

class ConvertViewController: UIViewController, ButtonImageDelegate {
    var converter: Converter?
    var quote: Quote?
    var baseQuote: Quote?
    
    func setSecondImage(image: UIImage?) {
        guard let image = image else { return }
        self.buttonTwo.setImage(image, for: .normal)
    }
    
     //cell.imageView?.image = UIImage(named: quote.id)
    func setBtnImage(image: UIImage?) {
        guard let image = image else { return }
        print("set image")
        self.buttonOne.setImage(image, for: .normal)
    }
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    @IBAction func textActionOne(_ sender: Any) {
        
        let amount = Double(text1.text ?? "0")
        guard let quote = quote, let baseQuote = baseQuote else { return }
        text2.text = Converter.convertQuote(amount: amount ?? 0, convertQuote: quote, baseQuote: baseQuote )
    }
    @IBAction func textActionTwo(_ sender: Any) {
       
        
    }
    
    @IBAction func pushOne(_ sender: Any) {
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .from
        ns.btnSetImageDelegate = self
                  present(ns, animated: true, completion: nil)

    }
    @IBAction func pushTwo(_ sender: Any) {
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .to
        ns.btnSetImageDelegate = self
        
                  present(ns, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
}
