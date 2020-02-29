//
//  SpinnerDataSource.swift
//  Decoder
//
//  Created by shashank atray on 26/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class SpinnerDataSource: NSObject, UITableViewDataSource {
    
    var spinnerData: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return spinnerData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if( !(cell != nil)) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }

        cell!.textLabel?.text = (spinnerData[indexPath.row] as! String)
        return cell!
       }

}
