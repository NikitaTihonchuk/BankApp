//
//  BelarusbankModel.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import Foundation
import Moya
import ObjectMapper

struct Location: Decodable {
    var address: String
    var work_time: String
    var gps_x: String
    var gps_y: String
    var currency: String
    var city: String
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case work_time = "work_time"
        case gps_x = "gps_x"
        case gps_y = "gps_y"
        case currency = "currency"
        case city = "city"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.work_time = try container.decode(String.self, forKey: .work_time)
        self.gps_x = try container.decode(String.self, forKey: .gps_x)
        self.gps_y = try container.decode(String.self, forKey: .gps_y)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.city = try container.decode(String.self, forKey: .city)
        
    }
}

struct Gems: Decodable {
    
    var attestat: String
    var nameRu: String
    var grani: String
    var weight: String
    var color: String
    var cost: String
    var name: String    
    
    enum CodingKeys: String, CodingKey {
       case attestat = "attestat"
       case nameRu = "name_ru"
       case grani = "grani"
       case weight = "weight"
       case color = "color"
       case cost = "cost"
       case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attestat = try container.decode(String.self, forKey: .attestat)
        self.nameRu = try container.decode(String.self, forKey: .nameRu)
        self.grani = try container.decode(String.self, forKey: .grani)
        self.weight = try container.decode(String.self, forKey: .weight)
        self.color = try container.decode(String.self, forKey: .color)
        self.cost = try container.decode(String.self, forKey: .cost)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
