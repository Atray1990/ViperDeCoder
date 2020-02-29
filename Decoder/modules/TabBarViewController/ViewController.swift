//
//  ViewController.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navigator = ChatNavigatorRouting()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    
    

    
    @IBAction func goToDevChat() {
        
        if let navController = self.navigationController {
            self.navigator.makeChatViewController(from: navController)
        }
        
        
       // self.navigationController?.pushViewController(viewController, animated: true)
        print("Anything")
    }

}

