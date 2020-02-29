//
//  CodesViewController.swift
//  Decoder
//
//  Created by shashank atray on 23/02/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class CodesViewController: UIViewController {
    
    var eventHandler: CodeEventHandlerConnector!
    let codeDataSource = CodeDataSource()
    let spinerDataSource = SpinnerDataSource()
    
    
 
    @IBOutlet weak var codeTableView: UITableView!
    @IBOutlet weak var dropDownTableView: UITableView!
    
    var allSelect: Bool = false
    var trendSelect: Bool = false
    let allSelectAarray = ["trending","Most Popular", "recent", "My Codes"]
    let trendingAarray = ["Java","Python", "Swift", "C#", "kotlin", "Ruby"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.codeTableView.dataSource = codeDataSource
        self.dropDownTableView.dataSource = spinerDataSource
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUp()
    }
    
    func setUp() {
        eventHandler.fetchCodedata()
        self.codeTableView.reloadData()
    }
    
    func showUpdatedData(codeData : [CodeData]) {
        self.codeDataSource.codeData = codeData
       
         DispatchQueue.main.async {
            self.codeTableView.reloadData()
        }
    }
    
    // MARK :- IBAction
    @IBAction func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickedTrending() {
        if trendSelect {
            self.dropDownTableView.isHidden = true
            trendSelect = false
        } else {
            self.spinerDataSource.spinnerData = trendingAarray
            self.dropDownTableView.reloadData()
            trendSelect = true
            allSelect = false
            self.dropDownTableView.isHidden = false
        }
        
    }
    
    @IBAction func clickedAll() {
        if allSelect {
            self.dropDownTableView.isHidden = true
            allSelect = false
        } else {
            self.spinerDataSource.spinnerData = allSelectAarray
            self.dropDownTableView.reloadData()
            allSelect = true
            trendSelect = false
            self.dropDownTableView.isHidden = false
        }
        
    }

}
