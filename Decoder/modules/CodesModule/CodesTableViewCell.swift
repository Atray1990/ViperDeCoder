//
//  CodesTableViewCell.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class CodesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSenderComment: UILabel!
    @IBOutlet weak var lblSenderName: UILabel!
    @IBOutlet weak var ivSenderImage: UIImageView!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var upVoteLabel: UILabel!
    @IBOutlet weak var downVoteLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // UI setting
        ivSenderImage.layer.cornerRadius = ivSenderImage.frame.width/2
        
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
