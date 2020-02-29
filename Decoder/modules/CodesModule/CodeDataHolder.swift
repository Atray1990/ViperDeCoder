//
//  CodeDataHolder.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation

import UIKit

struct CodeData {
    
    let userName: String
    let userImageUrl: String
    let time: String
    let text: String
    let code: String
    let codeLanguage: String
    let upVotes: Int
    let downVotes: Int
    let comments: Int
    let tags: [AnyObject]
}

