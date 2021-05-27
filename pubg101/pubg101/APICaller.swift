//
//  APICaller.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/27/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let myURL = URL(string: "https://raw.githubusercontent.com/jervygu/json-pubg101/master/pubg-weapons.json")
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    private init() {}
    
    public func getWeapons(completion: @escaping(Result<APIResponse, Error>) -> Void) {
        guard let url = Constants.myURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
//                print(result)
                completion(.success(result))
            } catch {
                print("UserProfile: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
