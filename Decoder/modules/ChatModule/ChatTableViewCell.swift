//
//  ChatTableViewCell.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblPlayerPosition: UILabel!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var ivPlayerImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblPlayerName.backgroundColor = UIColor(patternImage: UIImage(named: "download.png")!)
        // UI setting
        ivPlayerImage.layer.cornerRadius = ivPlayerImage.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupWithPhoto(imgURL: String) {
        if !imgURL.contains("https") {
            var imgURLNew = imgURL.dropFirst(4)
            imgURLNew = "https"+imgURLNew
            ivPlayerImage.downLoadHttpImage(from: String(imgURLNew)) { (err) in
                if err != nil {
                }
            }
        }
    }

}

class receivedMessageCell: UITableViewCell {
    
 
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var ivSenderImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // UI setting
        ivSenderImage.layer.cornerRadius = ivSenderImage.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupWithPhoto(imgURL: String) {
        if !imgURL.contains("https") {
            var imgURLNew = imgURL.dropFirst(4)
            imgURLNew = "https"+imgURLNew
            ivSenderImage.downLoadHttpImage(from: String(imgURLNew)) { (err) in
                if err != nil {
                }
            }
        }
    }

}

