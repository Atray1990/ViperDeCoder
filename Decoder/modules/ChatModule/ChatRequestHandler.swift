//
//  ChatRequestHandler.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation

public protocol ChatRequestHandlerUseCase {
    func requestForUserDataWith(searchText: String, completionHandler: @escaping(_ result: [AnyObject]) -> ())
}

extension ChatRequestHandlerUseCase {
    
    public func requestForUserDataWith(searchText: String, completionHandler: @escaping(_ result: [AnyObject]) -> ()) {
        let url = URL(string: searchText)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
           if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) {
                completionHandler([responseJSON] as [AnyObject])
            }
        }
        
        task.resume()
    }
}

public struct ChatRequestHandler: ChatRequestHandlerUseCase {
    public init() {}
}

