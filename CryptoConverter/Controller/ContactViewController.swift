//
//  ContactViewController.swift
//  CryptoConverter
//
//  Created by Мак on 11/27/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.layer.cornerRadius = myImage.frame.size.width / 2
        myImage.contentMode = .scaleAspectFill
    myImage.clipsToBounds = true
//overrideUserInterfaceStyle = .light
     title = "Контакты"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
