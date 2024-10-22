//
//  StockDataManger.swift
//  AwesomeProject
//  使用 async/await 实现异步任务请求数据
//  Created by 林 on 2024/10/22.
//

import ObjectiveC
import Foundation

struct Stock: Decodable {
    let symbol: String
    let price: Double
}

class StockDataManger:NSObject{
    
    static let shared:StockDataManger = StockDataManger()
    // Define a model conforming to Decodable to parse JSON response
    
    
    // Modify the fetchData function to parse the JSON response
    func fetchStockData(from urlString: String) async throws -> Stock {
        let data = try await fetchData(from: urlString)
        let decoder = JSONDecoder()
        
        // Decode the JSON response
        let stock = try decoder.decode(Stock.self, from: data)
        return stock
    }
    
    // Define the data fetching function using async/await
    func fetchData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL) // Handle invalid URL error
        }
        
        // Perform the network request asynchronously
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
}
