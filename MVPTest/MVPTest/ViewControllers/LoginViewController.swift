//
//  LoginViewController.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class LoginViewController: GeneralViewController {
    var presenter:VCLoginPresenter?;
    @IBOutlet weak var UIEmailTF: UITextField!
    @IBOutlet weak var UIPasswordTF: UITextField!

    @IBAction func LoginOnClick(_ sender: Any) {
        presenter?.Authenticate(email: self.UIEmailTF.text!, password: self.UIPasswordTF.text!);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UIEmailTF.delegate=self;
        self.UIPasswordTF.delegate=self;
        self.presenter?.vcloginDelegate=self;
    }
}
//MARK: -VCLoginDelegate func
extension LoginViewController:VCLoginDelegate{
    func failedLogin(message: String) {
        //failed login
    }
    
    func successLogin(userInfo: UserInfo) {
        //success login
    }
}
