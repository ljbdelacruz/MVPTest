//
//  UserInfo.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
struct UserInfo{
    var id, email, password:String;
    init() {
        self.id="";
        self.email="";
        self.password=""
    }
    mutating func set(id:String, email:String, password:String){
        self.id=id;
        self.email=email;
        self.password=password;
    }
}
