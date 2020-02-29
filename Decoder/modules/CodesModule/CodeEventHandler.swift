//
//  CodeEventHandler.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation

open class CodeEventHandlerConnector {
    
    weak var viewController: CodesViewController?
    let navigator: CodeNavigatorRouting
    let requestHandler: ChatRequestHandler
    
    init(viewController: CodesViewController, requestHandler: ChatRequestHandler, navigator: CodeNavigatorRouting ) {
        self.viewController = viewController
        self.requestHandler = requestHandler
        self.navigator = navigator
    }
    
    
    func fetchCodedata() {
        requestHandler.requestForUserDataWith( searchText: "https://dcoder.tech/test_json/codes.json") { result in
            
            if !(result.isEmpty) {
            let codeData = self.codeDataGetter(codeDataGetter: result.first as! [AnyObject])
            if let viewController = self.viewController {
                viewController.showUpdatedData(codeData:codeData )
            }
                
            }
        }
    }
    
    
    func codeDataGetter(codeDataGetter: [AnyObject]) -> [CodeData] {
        
        let codeData: [CodeData] = codeDataGetter.map { photoDictionary in
            
            let userName = photoDictionary["user_name"] as? String ?? ""
            let userImageUrl = photoDictionary["user_image_url"] as? String ?? ""
            let timeStamp = photoDictionary["time"] as? Double ?? 0
            let time = convertTime(timeStamp: timeStamp)
            let tags = photoDictionary["tags"] as? [AnyObject] ?? []
            let title = photoDictionary["title"] as? String ?? ""
            let code = photoDictionary["code"] as? String ?? ""
            let code_language = photoDictionary["code_language"] as? String ?? ""
            let upVotes = photoDictionary["upvotes"] as? Int ?? 0
            let downvotes = photoDictionary["downvotes"] as? Int ?? 0
            let comments = photoDictionary["comments"] as? Int ?? 0
            
            
            let codeData = CodeData.init(userName: userName, userImageUrl: userImageUrl, time: time, text:title , code: code, codeLanguage: code_language, upVotes: upVotes, downVotes: downvotes, comments: comments, tags: tags)
            return codeData
        }
        return codeData
    }
    
    func convertTime(timeStamp: Double) -> String {
            let date = Date(timeIntervalSince1970: timeStamp)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
    }
    
}
