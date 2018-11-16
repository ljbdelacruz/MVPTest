//
//  GeneralViewController.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    weak var tfAccessory:TFAccessory?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfAccessory=TFAccessory(view: self.view);
    }
}
extension GeneralViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as! AdjustingTF).Move(view: self.view, duration: 0.5, moveDistance: 100, up: false)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as! AdjustingTF).Move(view: self.view, duration: 0.5, moveDistance: 0, up: false)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return true;
    }
}
//Setup button for keyboard accessory
extension GeneralViewController{
    func SetupKeyBButton(){
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done
            ,target: self, action: #selector(CloseKeyboard))
        doneButton.tintColor=UIColor.white
        self.tfAccessory?.setupButton(button: doneButton, position: .rightitem)
    }
    @objc func CloseKeyboard(){
        self.view.endEditing(true);
    }
}
