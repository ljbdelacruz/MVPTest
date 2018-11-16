//
//  VCLoginPresenter.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol  VCLoginDelegate{
    func successLogin(userInfo:UserInfo);
    func failedLogin(message:String);
//    func userListResponse(users:[User])
}
extension VCLoginDelegate{
    func userListResponse(users:[User]){
        //this is a empty implementation to allow this method to be optional
    }

}

class VCLoginPresenter:NSObject{
    let userProvider=MoyaProvider<UserService>()
    let provider = MoyaProvider<WeatherDataService>()
    var vcloginDelegate:VCLoginDelegate?;
    var userInfo:UserInfo=UserInfo();
    func Authenticate(email:String, password:String){
        if email.count > 0 && password.count > 0 {
            FirebaseCustom.AuthUser(email: email, password:password, completionHandler: {
                (res, err) in
                if err == nil{
                    self.userInfo.set(id: "", email: email, password: password);
                    self.vcloginDelegate?.successLogin(userInfo: self.userInfo);
                }else{
                    self.vcloginDelegate?.failedLogin(message: "Please use valid email and password or make sure device is connected to the internet");
                }
            })
        }else {
            self.vcloginDelegate?.failedLogin(message: email.count <= 0 ? "Please fill email field" : "Please fill password field")
        }
    }
    func loadUsers(){
        self.userProvider.request(.readUsers, completion: { (result) in
            switch result {
            case .success(let response):
                let users = try! JSONDecoder().decode([User].self, from: response.data)
                self.vcloginDelegate?.userListResponse(users: users);
            case .failure(let error):
                print(error)
            }
        })
    }
    func loadWeatherData(){
        print("Loading Weather Data");
        self.provider.request(.GetByLonLat(lon: 35, lat: 139), completion: {
            (data) in
                print("Request done")
                print(data);
        })
    }
}
