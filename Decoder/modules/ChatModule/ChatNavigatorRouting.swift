//
//  ChatNavigatorRouting.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation
import UIKit

public protocol ChatNavigatorNavigatable {
    func makeChatViewController(from navController: UINavigationController)
}

extension ChatNavigatorNavigatable {
    public func makeChatViewController(from navController: UINavigationController) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       let viewController = storyBoard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        let requestHandler = ChatRequestHandler()
        let navigator = ChatNavigatorRouting()
               
        let eventHandler = ChatEventHandlerConnector.init(viewController: viewController, requestHandler: requestHandler, navigator: navigator)
        viewController.eventHandler = eventHandler
        navController.pushViewController(viewController, animated: true)
    }
}

open class ChatNavigatorRouting: ChatNavigatorNavigatable {
    
    public init() {
    }
}
