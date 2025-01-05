//
//  HttpUtility.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation

struct HttpUtility {
    
    func get<T: Decodable>(urlRequest: URLRequest, resultType: T.Type, completionHandler: @escaping(_ httpURLResponse: HTTPURLResponse?, _ result: T?, _ error: String?) -> Void) {
//        var urlRequest2 = urlRequest
//        urlRequest2.timeoutInterval = 60.0
        URLSession.shared.dataTask(with: urlRequest) { responseData, httpUrlResponse, error in
            if error == nil && responseData != nil && responseData?.count != 0 {
//                if let httpUrlResponse = httpUrlResponse as? HTTPURLResponse {
//                    print("status code: ")
//                    print(httpUrlResponse.statusCode)
//                    if httpUrlResponse.statusCode == 401 {
//                    }
//                }
                
                let str = String(decoding: responseData!, as: UTF8.self)
                debugPrint(urlRequest.url ?? "No URL found")
                print(str)
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(httpUrlResponse as? HTTPURLResponse, result, nil)
                } catch let error {
                    
                    debugPrint(urlRequest.url ?? "No URL found")
                    debugPrint("Error occured while decoding : ")
                    debugPrint(error)
                    completionHandler(httpUrlResponse as? HTTPURLResponse, nil, error.localizedDescription)
                }
            } else {
                debugPrint(urlRequest.url ?? "No URL found")
                debugPrint(httpUrlResponse)
                debugPrint("something went wrong")
                completionHandler(httpUrlResponse as? HTTPURLResponse, nil, error?.localizedDescription)
            }
        }.resume()
    }
}
