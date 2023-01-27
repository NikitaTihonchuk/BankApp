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

struct Metal: Decodable {
    var gold10: String
    var gold20: String
    var gold50: String
    var silver10: String
    var silver20: String
    var silver50: String
    var platina10: String
    var platina20: String
    var platina50: String

    var city: String
    var department: String
    
    enum CodingKeys: String, CodingKey {
       case gold10 = "ZOL_10_out"
       case gold20 = "ZOL_20_out"
       case gold50 = "ZOL_50_out"
       case silver10 = "SIL_10_out"
       case silver20 = "SIL_20_out"
       case silver50 = "SIL_50_out"
       case platina10 = "PL_10_out"
       case platina20 = "PL_20_out"
       case platina50 = "PL_50_out"

       case city = "name"
       case department = "filials_text"
       
      
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gold10 = try container.decode(String.self, forKey: .gold10)
        self.gold20 = try container.decode(String.self, forKey: .gold20)
        self.gold50 = try container.decode(String.self, forKey: .gold50)
        self.silver10 = try container.decode(String.self, forKey: .silver10)
        self.silver20 = try container.decode(String.self, forKey: .silver20)
        self.silver50 = try container.decode(String.self, forKey: .silver50)
        self.platina10 = try container.decode(String.self, forKey: .platina10)
        self.platina20 = try container.decode(String.self, forKey: .platina20)
        self.platina50 = try container.decode(String.self, forKey: .platina50)
        self.city = try container.decode(String.self, forKey: .city)
        self.department = try container.decode(String.self, forKey: .department)
    }
}

struct News: Decodable {
    var titleName: String
    var link: String
    var image: String
    
    
    enum CodingKeys: String, CodingKey {
        case titleName = "name_ru"
        case link = "link"
        case image = "img"
      
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.titleName = try container.decode(String.self, forKey: .titleName)
        self.link = try container.decode(String.self, forKey: .link)
        self.image = try container.decode(String.self, forKey: .image)
    }
}

struct Fillials: Decodable {
    var fillialName: String
    var city: String
    var street: String
    var coordinateX: String
    var coordinateY: String
    
    enum CodingKeys: String, CodingKey {
        case fillialName = "filial_name"
        case city = "name"
        case street = "street"
        case coordinateX = "GPS_X"
        case coordinateY = "GPS_Y"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fillialName = try container.decode(String.self, forKey: .fillialName)
        self.city = try container.decode(String.self, forKey: .city)
        self.street = try container.decode(String.self, forKey: .street)
        self.coordinateX = try container.decode(String.self, forKey: .coordinateX)
        self.coordinateY = try container.decode(String.self, forKey: .coordinateY)

    }
    
}
