//
//  NetworkManager.swift
//  TicTacToe
//
//  Created by Kranti on 2024/2/4.
//

import Foundation

class NetworkManager {
    // singleton instance for requesting and posting apis
    static var shared = NetworkManager()
    
    
    // GET Request
    func getRequest<T: Decodable>(endpoint: String, completion: @escaping(Result<T, Error>) -> Void) {
        
        
        // unwrap url when converting to url object
        guard let urlObject = URL(string: "https://jsonplaceholder.typicode.com\(endpoint)") else { return }
        
        // make the http GET api request
        let task = URLSession.shared.dataTask(with: urlObject) { data, response, error in
            
            // handle error
            if let error = error {
                print("DEBUG: Error occured when fetching request")
                completion(.failure(error))
                return
            }
            
            // handle successful data retrieved
            guard let data = data else { return }
            
            print("DEBUG: data after initializing getRequest - \(data)")
            
            // asynchronously handle api request
            DispatchQueue.main.async {
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    
                    // provide data to function caller in closure
                    completion(.success(decodedData))
                } catch {
                    print("DEBUG: Error when attempting to decode JSON data")
                }
            }
            
        }
        
        task.resume()
        
    }
    
}
