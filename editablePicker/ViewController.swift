//
//  ViewController.swift
//  editablePicker
//
//  Created by Joseph Ward on 2/09/17.
//  Copyright © 2017 Joethermal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var defaultItems = ["Earth","Moon","Sun","Stars","Mars"]
    var userAddedItems: [String] = []
    
    @IBAction func addButton(_ sender: Any) {
        if textField.text != "" {
        if let new = textField.text {
            userAddedItems.append(new)
            UserDefaults.standard.set(userAddedItems, forKey: "pickerB")
            defaultItems.append(new)
            pickerView.reloadAllComponents()
        }
        textField.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadComponents()
    }
    
    
    func loadComponents(){
        if let userItems = UserDefaults.standard.object(forKey: "pickerB") as! [String]? {
                defaultItems.append(contentsOf: userItems)
                userAddedItems.append(contentsOf: userItems)
         }
        
              pickerView.reloadAllComponents()
    }
    
    
}



extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return defaultItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return defaultItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = defaultItems[row]
    }
    
    
}

