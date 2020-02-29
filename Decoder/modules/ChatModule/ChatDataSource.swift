//
//  ChatDataSource.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class ChatDataSource: NSObject, UITableViewDataSource  {
    var chatData: [ChatData]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let chatValue = chatData {
            return chatValue.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let chatValueArray = chatData, let chatValue = chatValueArray[indexPath.row] as? ChatData {
            if chatValue.sentSelf {
                
                let playerCell:PlayerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
                
                if let imgUrl = chatValue.userImageUrl as? String {
                    playerCell.setupWithPhoto(imgURL: imgUrl)
                }
                playerCell.lblPlayerName.text = chatValue.text
                
                
                return playerCell
            } else {
                
                let receivedCell:receivedMessageCell = tableView.dequeueReusableCell(withIdentifier: "receivedMessageCell", for: indexPath) as! receivedMessageCell
                
                if let imgUrl = chatValue.userImageUrl as? String {
                    receivedCell.setupWithPhoto(imgURL: imgUrl)
                }
                receivedCell.lblText.text = chatValue.text
                
                return receivedCell
            }
        } else {
        
        let PlayerCell:PlayerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        return PlayerCell
        }
    }
    

}
