//
//  CodeConnectViewController.swift
//  Decoder
//
//  Created by shashank atray on 26/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class CodeConnectViewController: UIViewController {
     let codeNavigator = CodeNavigatorRouting()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToCodeScreen() {
    
    if var navController = self.navigationController {
        self.codeNavigator.makeCodesViewController(from: navController)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
