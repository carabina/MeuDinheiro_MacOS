//
//  HistorySplitController.swift
//  MeuDinheiro
//
//  Created by Chrystian on 18/09/2018.
//  Copyright © 2018 Salgados Productions. All rights reserved.
//

import Foundation
import Cocoa

class HistorySplitController: NSSplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groupViewController = GroupViewController()
        groupViewController.configure(textTitle: "Objetos", data: ["Janeiro, Fevereiro, Março"])
        
    }
}
