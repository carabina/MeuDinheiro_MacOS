//
//  EntryDetailController.swift
//  MeuDinheiro
//
//  Created by Chrystian on 18/08/2018.
//  Copyright © 2018 Salgados Productions. All rights reserved.
//

import Foundation
import Cocoa

class  EntryDetailController: NSViewController {
    
    @IBOutlet weak var btnSave: NSButton!
    @IBOutlet weak var lbTitle: NSTextField!
    @IBOutlet weak var tfEntryData: NSTextField!
    @IBOutlet weak var btnNext: NSButton!
    @IBOutlet weak var tlgDebit: NSButton!
    @IBOutlet weak var tlgCredit: NSButton!
    @IBOutlet weak var skToogle: NSStackView!
    
    private var dataValue: String?
    private var dataDescription: String?
    private var dataBoolean: Bool?
    
    private var controlView: Int = 1
    
    override func viewDidLoad(){
        self.btnSave.isHidden = true
        self.skToogle.isHidden = true
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    private func setupNextValue(viewIndex : Int ){
        lbTitle.alphaValue = 0
        tfEntryData.stringValue = ""
        let a = NSAnimation()
        a.duration = 1
        a.start()
        switch viewIndex {
        case 2:
            lbTitle.stringValue = "Descrição"
        default:
            skToogle.isHidden = false
            tfEntryData.isHidden = true
            lbTitle.stringValue = "Debito ou Credito"
        }
        
        lbTitle.alphaValue = 1
    }
    
    private func setupInvalidData() {
        self.tfEntryData.placeholderString = "Insira um valor valido para continuar"
    }
    
    private func retriveData() -> String? {
        if tfEntryData != nil {
            return tfEntryData.stringValue
        } else {
            return nil
        }
    }
    
    // MARK: - Actions
    @IBAction func actionNext(_ sender: Any) {
        switch controlView {
        case 1:
            if let value = retriveData() {
                self.dataValue = value
            } else {
                setupInvalidData()
            }
            
            controlView += 1
            setupNextValue(viewIndex: controlView)
        case 2:
            if let value = retriveData() {
                self.dataDescription = value
            } else {
                setupInvalidData()
            }
            
            controlView += 1
            setupNextValue(viewIndex: controlView)
            
            
            
            self.btnSave.isHidden = false
            self.btnNext.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func tlgCreditDebit(_ sender: NSButton) {
        switch sender.tag {
        case 0:
            tlgDebit.state = .off
            self.dataBoolean = true
        case 1:
            tlgCredit.state = .off
            self.dataBoolean = false
        default:
            break
        }
    }
    
    
    @IBAction func actionSave(_ sender: Any) {
        print("\(String(describing: dataValue)) \n \(String(describing: dataDescription)) \n \(String(describing: dataBoolean)) ")
        self.dismissViewController(self)
    }
}
