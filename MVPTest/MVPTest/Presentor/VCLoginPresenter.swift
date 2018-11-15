//
//  VCLoginPresenter.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
protocol  VCLoginDelegate{
    func successLogin(userInfo:UserInfo);
    func failedLogin(message:String);
}

class VCLoginPresenter:NSObject{
    var vcloginDelegate:VCLoginDelegate?;
    var userInfo:UserInfo=UserInfo();    
    func Authenticate(email:String, password:String){
        FirebaseCustom.AuthUser(email: email, password:password, completionHandler: {
            (res, err) in
            if err == nil{
                self.userInfo.set(id: "", email: email, password: password);
                self.vcloginDelegate?.successLogin(userInfo: self.userInfo);
            }else{
                self.vcloginDelegate?.failedLogin(message: "Please use valid email and password or make sure device is connected to the internet");
            }
        })
    }

}
