//
//  CommonCategories.swift
//  Totality_Corp_Test
//
//  Created by shashank atray on 02/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation
import UIKit

extension NSObject{

    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        
        if let data = (text as AnyObject).data(using: String.Encoding.utf8.rawValue){
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                
                return json
                
            } catch {
                return nil
            }
        }
        return nil
    }
    
    
    func defractorJson(text: String) -> [String:AnyObject]? {
        
        if let path = Bundle.main.path(forResource: text, ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    return json
                    
                } catch {
                    return nil
                }
            }
            return nil
        }
        
}

public extension Date {
    func daysTo(_ date: Date) -> Int? {
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
}


// Uiimage view
extension UIImageView
{
    func DownloadImageForCollectionView (from url : String, completion: ((_ errorMessage: String?) -> Void)?){
        if url.count == 0
        {
            return
        }
        let urlRequest = URLRequest(url: URL(string: "https://dcoder.tech/avatar/dev7.png")!)
        let task = URLSession.shared.dataTask(with: urlRequest){ (data,response,error) in
            
            if error != nil {
                completion?("error...")
            }
            
            DispatchQueue.main.async {
                if data != nil{
                    self.image = UIImage(data:data!)
                    
                }
                completion?(nil)
            }
        }
        
        task.resume()
    }
    
    func downLoadHttpImage(from url : String, completion: ((_ errorMessage: String?) -> Void)?) {
        if url.count == 0
        {
            return
        }
        let url = URL(string: url)

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() {
                if data != nil{
                    self.image = UIImage(data:data)
                    
                }
                completion?(nil)
            }
        }

        task.resume()
    }
    
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url, contentMode: mode)
    }
    
}

// value or states of string

extension String
{
    func trimmedString() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
}


