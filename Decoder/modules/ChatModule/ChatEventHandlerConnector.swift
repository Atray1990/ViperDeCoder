//
//  ChatEventHandlerConnector.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation

open class ChatEventHandlerConnector {
    
    weak var viewController: ChatViewController?
    let navigator: ChatNavigatorRouting
    let requestHandler: ChatRequestHandler
    
    init(viewController: ChatViewController, requestHandler: ChatRequestHandler, navigator: ChatNavigatorRouting) {
        self.viewController = viewController
        self.requestHandler = requestHandler
        self.navigator = navigator
    }
    
    
    func fetchChatdata() {
        requestHandler.requestForUserDataWith( searchText: "https://dcoder.tech/test_json/chat.json") { result in
            
            if !(result.isEmpty) {
                let chatData = self.chatDataGetter(flickrPhotos: result.first as! [AnyObject])
                if let viewController = self.viewController {
                    viewController.showChatMessages(chatMessage: chatData)
                }
            }
        }
    }
    
    func chatDataGetter(flickrPhotos: [AnyObject]) -> [ChatData] {
        
        let chatData: [ChatData] = flickrPhotos.map { photoDictionary in
            
            let userName = photoDictionary["user_name"] as? String ?? ""
            let userImageUrl = photoDictionary["user_image_url"] as? String ?? ""
            let sentSelf = photoDictionary["is_sent_by_me"] as? Bool ?? false
            let text = photoDictionary["text"] as? String ?? ""
           
            let chatData = ChatData.init(userName: userName, userImageUrl: userImageUrl, sentSelf: sentSelf, text: text)
            return chatData
        }
        return chatData
    }
    
    
}
