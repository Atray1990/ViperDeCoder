//
//  ChatViewController.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    var eventHandler: ChatEventHandlerConnector!
    let chatDataSource = ChatDataSource()
    @IBOutlet weak var senderView: UIView!
    let string = "test"

    @IBOutlet weak var chatTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eventHandler.fetchChatdata()
    }
    
    func setUp() {
        self.chatTableView.dataSource = chatDataSource
        self.chatTableView.reloadData()
        senderView.layer.borderWidth = 2
        senderView.layer.borderColor = UIColor.lightGray.cgColor
        senderView.layer.cornerRadius = 4
        
    }
    
    func showChatMessages(chatMessage : [ChatData]) {
        print("called here")
        self.chatDataSource.chatData = chatMessage
       DispatchQueue.main.async {
            self.chatTableView.reloadData()
        }
    }
    
    @IBAction func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
