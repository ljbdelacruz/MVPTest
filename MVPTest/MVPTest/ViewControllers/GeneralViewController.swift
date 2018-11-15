//
//  GeneralViewController.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GeneralViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as! AdjustingTF).Move(view: self.view, duration: 0.5, moveDistance: 100, up: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as! AdjustingTF).Move(view: self.view, duration: 0.5, moveDistance: 0, up: true)
    }
}
