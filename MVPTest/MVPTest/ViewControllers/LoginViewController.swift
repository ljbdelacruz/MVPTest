//
//  LoginViewController.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import SVProgressHUD


class LoginViewController: GeneralViewController {
    var presenter:VCLoginPresenter?;
    @IBOutlet weak var UIEmailTF: UITextField!
    @IBOutlet weak var UIPasswordTF: UITextField!
    @IBAction func LoginOnClick(_ sender: Any){
        presenter?.Authenticate(email: self.UIEmailTF.text!, password: self.UIPasswordTF.text!);
        SVProgressHUD.show();
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetupKeyBButton();
        self.UIEmailTF.delegate=self;
        self.UIPasswordTF.delegate=self;
        self.UIEmailTF.inputAccessoryView=self.tfAccessory?.navbarAccessory;
        self.UIPasswordTF.inputAccessoryView=self.tfAccessory?.navbarAccessory;
        self.presenter?.vcloginDelegate=self;
        self.presenter?.loadWeatherData()
    }
}

//MARK: -VCLoginDelegate func
extension LoginViewController:VCLoginDelegate{
    //based on what i understand viewController will only handle the view part separating the logic and into
    //the presenter and uses protocols to communicate to viewController for updates on the process in the presenter
    func failedLogin(message: String) {
        //failed login
        SVProgressHUD.dismiss();
    }
    func successLogin(userInfo: UserInfo) {
        //success login
        SVProgressHUD.dismiss();
    }
    //this method of delegate is not required to implepment when delegate is assign to VC
    func userListResponse(users: [User]) {
        print(users[0]);
    }
}

