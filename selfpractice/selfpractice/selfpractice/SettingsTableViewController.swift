//
//  SettingsTableViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 15/3/22.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var nameField: UITextField!
    let testString  = "testString"
    let nameKey  = "nameKey"
    let soundKey = "soundKey"
    let volumeKey  = "volumeKey"
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSettings()
        self.tableView.separatorStyle = .none


    }
    func loadSettings(){
        if let name = UserDefaults.standard.string(forKey: nameKey){
            nameField.text =  name
            }
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: soundKey)
        volumeSlider.value = UserDefaults.standard.float(forKey: volumeKey)
    }
   
    @IBAction func changeNameAction(_ sender: UITextField) {
       
        if (sender.text != nil){
            UserDefaults.standard.set(sender.text!, forKey: nameKey)
        }
    }
    @IBAction func soundAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    @IBAction func volumeAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volumeKey)
    }
}

