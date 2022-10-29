//
//  ViewModel.swift
//  JunoAssignment
//
//  Created by Avinash Kumar on 29/10/22.
//

import Foundation

final class ViewModel {
    var cryptoHolding = [YourCryptoHolding]()
    var cryptoDetails: CryptoDetails?
    var cryptoPrice = [CryptoPrice]()
    var count = 0
    
    func fetchResponse() {
        let urlString = "\(APIConstants.urlString)"
        performRequest(urlString: urlString) { details in
            print(details.cryptoPrices)
            print(details.yourCryptoHoldings)
            for item in details.yourCryptoHoldings {
                self.cryptoHolding.append(item)
            }
            
            for item in details.cryptoPrices {
                self.cryptoPrice.append(item)
            }
            
            self.cryptoDetails = details
        }
    }
    
    func getHoldingDetails(index: Int) -> YourCryptoHolding {
        return self.cryptoHolding[index]
    }
    
    func getCryptoPriceList(index: Int) -> CryptoPrice {
        return self.cryptoPrice[index]
    }
    
    func getCryptosCount() -> Int {
        return self.cryptoPrice.count
    }
    
    
    func performRequest(urlString: String, completionHandler: @escaping (CryptoDetails) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
    
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            } else {
                if let safeData = data {
                    self.parseJSON(apiData: safeData) { response in
                        completionHandler(response)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(apiData: Data, completionHandler: @escaping (CryptoDetails)->()) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CryptoDetails.self, from: apiData)
            completionHandler(decodedData)
        } catch {
            print(error)
        }
    }
}


