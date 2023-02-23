//
//  FetchApi.swift
//  ViewPastTransfers
//
//  Created by Kamal Sahu on 23/02/23.
//

import Foundation

class FetchApi
{
    func loadJson() -> [TransferListModel]?
    {
       if let url = Bundle.main.url(forResource: "TransferListData", withExtension: "json")
        {
           let decoder = JSONDecoder()
           do{
               let data = try Data(contentsOf: url)
               let result = try decoder.decode([TransferListModel].self, from: data)
               debugPrint(result)
               return result
           }
           catch
           {
               debugPrint(error)
           }
       }
        return []
        
    }
}
