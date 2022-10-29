//
//  Model.swift
//  JunoAssignment
//
//  Created by Avinash Kumar on 29/10/22.
//

import Foundation

// MARK: - CryptoDetails
struct CryptoDetails: Codable {
    let cryptoBalance: CryptoBalance
    let yourCryptoHoldings: [YourCryptoHolding]
    let cryptoPrices: [CryptoPrice]
    let allTransactions: [AllTransaction]

    enum CodingKeys: String, CodingKey {
        case cryptoBalance = "crypto_balance"
        case yourCryptoHoldings = "your_crypto_holdings"
        case cryptoPrices = "crypto_prices"
        case allTransactions = "all_transactions"
    }
}

// MARK: - AllTransaction
struct AllTransaction: Codable {
    let txnLogo: String
    let title, txnTime, txnAmount, txnSubAmount: String

    enum CodingKeys: String, CodingKey {
        case txnLogo = "txn_logo"
        case title
        case txnTime = "txn_time"
        case txnAmount = "txn_amount"
        case txnSubAmount = "txn_sub_amount"
    }
}

// MARK: - CryptoBalance
struct CryptoBalance: Codable {
    let title, subtitle, currentBALInUsd: String

    enum CodingKeys: String, CodingKey {
        case title, subtitle
        case currentBALInUsd = "current_bal_in_usd"
    }
}

// MARK: - CryptoPrice
struct CryptoPrice: Codable {
    let logo: String
    let title, currentPriceInUsd: String

    enum CodingKeys: String, CodingKey {
        case logo, title
        case currentPriceInUsd = "current_price_in_usd"
    }
}

// MARK: - YourCryptoHolding
struct YourCryptoHolding: Codable {
    let logo: String
    let title, currentBALInToken, currentBALInUsd: String

    enum CodingKeys: String, CodingKey {
        case logo, title
        case currentBALInToken = "current_bal_in_token"
        case currentBALInUsd = "current_bal_in_usd"
    }
}

