//
//  User.swift
//  JannahApp
//
//  Created by amal badr on 01/02/2024.
//

import Foundation
struct User{
    var id: String
    var phone:String

}

struct Ticket:Identifiable{
    var id:  String = UUID().uuidString
    var date:String
    var name:String
    var total:String
}
