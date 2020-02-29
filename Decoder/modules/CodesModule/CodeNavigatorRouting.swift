//
//  CodeNavigatorRouting.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation
import UIKit

public protocol CodeNavigatorNavigatable {
    func makeCodesViewController(from navController: UINavigationController)
}

extension CodeNavigatorNavigatable {
    
    public func makeCodesViewController(from navController: UINavigationController) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       let viewController = storyBoard.instantiateViewController(withIdentifier: "CodesViewController") as! CodesViewController
        let requestHandler = ChatRequestHandler()
        let navigator = CodeNavigatorRouting()
               
        let eventHandler = CodeEventHandlerConnector.init(viewController: viewController, requestHandler: requestHandler, navigator: navigator)
        viewController.eventHandler = eventHandler
        navController.pushViewController(viewController, animated: true)
        
    }
}

open class CodeNavigatorRouting: CodeNavigatorNavigatable {
    
    public init() {
     }
}
