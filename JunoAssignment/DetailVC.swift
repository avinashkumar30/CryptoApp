//
//  DetailVC.swift
//  JunoAssignment
//
//  Created by Avinash Kumar on 29/10/22.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var holdingName: UILabel!
    @IBOutlet weak var balanceInToken: UILabel!
    @IBOutlet weak var balanceInUSD: UILabel!
    
    var cryptoHolding: YourCryptoHolding?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoName.text = cryptoHolding?.title
        cryptoPrice.text = cryptoHolding?.currentBALInUsd
        if let logo = cryptoHolding?.logo {
            if let url = URL(string: logo) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        
        holdingName.text = cryptoHolding?.title
        balanceInUSD.text = cryptoHolding?.currentBALInUsd
        balanceInToken.text = cryptoHolding?.currentBALInToken
    }
}
