//
//  OrderModel.swift
//  exampleFirstApiData
//
//  Created by burak cakir on 4.11.2021.
//

import Foundation

struct OrderModel: Codable, Identifiable{
    var id : Int = 0
    var shipName : String = ""
    var shipAddress : shipAddress?
}

struct shipAddress: Codable{
    var street : String
    var city : String
    
}
