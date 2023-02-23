//
//  TransferListModel.swift
//  ViewPastTransfers
//
//  Created by Kamal Sahu on 22/02/23.
//

import Foundation

// MARK: - DataModelElement
struct TransferListModel: Codable {
    let id: Int
    let reciepientName, amount, transactionDate, type: String

    enum CodingKeys: String, CodingKey {
        case id
        case reciepientName = "reciepient_name"
        case amount
        case transactionDate = "transaction_date"
        case type
    }
}
