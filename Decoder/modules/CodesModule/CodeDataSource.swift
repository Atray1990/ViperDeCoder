//
//  CodeDataSource.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class CodeDataSource: NSObject, UITableViewDataSource  {
    
    var codeData: [CodeData]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if let codeValue = codeData {
                  return codeValue.count
              }
              return 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           let codeCell:CodesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CodesTableViewCell", for: indexPath) as! CodesTableViewCell
        
            if let CodeValueArray = codeData, let codeValue = CodeValueArray[indexPath.row] as? CodeData {
            
                if let imgUrl = codeValue.userImageUrl as? String {
                    codeCell.setupWithPhoto(imgURL: imgUrl)
                }
                codeCell.lblSenderName.text = codeValue.userName
                codeCell.lblSenderComment.text = codeValue.text
                codeCell.upVoteLabel.text = "\(codeValue.upVotes)"
                codeCell.downVoteLabel.text = "\(codeValue.downVotes)"
                codeCell.commentLabel.text = "\(codeValue.comments)"
                codeCell.dateLabel.text = "\(codeValue.time)"
                if let tag = codeValue.tags.first as? String {
                    codeCell.tabLabel.text = tag
                }
        }
        
       
           return codeCell
       }

}
