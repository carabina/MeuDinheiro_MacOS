
//
//  GroupViewController.swift
//  MeuDinheiro
//
//  Created by Chrystian on 18/09/2018.
//  Copyright © 2018 Salgados Productions. All rights reserved.
//

import Cocoa

class GroupViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var lblHeaderText: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var data: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        lblHeaderText.stringValue = "Algum titulo"
    }
    
    func configure(textTitle: String, data: [String]) {
//        lblHeaderText.stringValue = textTitle
        self.data = data
//        self.tableView.reloadData()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data == nil ? 0 : data!.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let text = data![row]
//        let identifier = tableColumn?.identifier
        return text
    }
//    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
//        var cell = tableView.vi
//        cell?.stringValue = data[row]
//        return cell
//    }
}
