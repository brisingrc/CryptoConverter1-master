//
//  ConvertViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/9/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

protocol ButtonImageDelegate {
    var quote: QuoteRealSw? { get set }
    var baseQuote: QuoteRealSw? {get set}
    func setBtnImage(image: UIImage?)
    func setSecondImage(image: UIImage?)
}

class ConvertViewController: UIViewController, ButtonImageDelegate {
    var converter: Converter?
    var quote: QuoteRealSw?
    var baseQuote: QuoteRealSw?
    
    func setSecondImage(image: UIImage?) {
        guard let image = image else { return }
        self.buttonTwo.setImage(image, for: .normal)
    }
    
     
    func setBtnImage(image: UIImage?) {
        guard let image = image else { return }
       // print("set image")
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
    
    
    @IBAction func pushOne(_ sender:  UIButton) {
        AudioServicesPlaySystemSound(SystemSoundID(1113))
        sender.pulsate()
      
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .from
        ns.btnSetImageDelegate = self
                  present(ns, animated: true, completion: nil)
        
        text1.text = ""
        text2.text = ""
    }
    @IBAction func pushTwo(_ sender: UIButton) {
        AudioServicesPlaySystemSound(SystemSoundID(1113))
        sender.pulsate()
        let ns = storyboard?.instantiateViewController(withIdentifier: "selectedCurrencyNSID") as! SelectTableViewController
        ns.quoteCurrency = .to
        ns.btnSetImageDelegate = self
        
                  present(ns, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Конвертировать"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
}

extension UIButton {
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.9
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
    
}
