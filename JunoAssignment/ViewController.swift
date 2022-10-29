//
//  ViewController.swift
//  JunoAssignment
//
//  Created by Avinash Kumar on 29/10/22.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = ViewModel()
    
    @IBOutlet weak var CryptoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CryptoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        let arr = viewModel.getCryptoPriceList(index: indexPath.row)
        cell.title.text = arr.title
        cell.currentPrice.text = arr.currentPriceInUsd
        if let url = URL(string: arr.logo) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.logo.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
}

//MARK: Segue
extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailVC {
            if let index = (CryptoTableView.indexPathForSelectedRow?.row) {
                destination.cryptoHolding = viewModel.getHoldingDetails(index: index)
            }
        }
    }
}
