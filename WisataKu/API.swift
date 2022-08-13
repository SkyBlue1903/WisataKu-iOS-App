//
//  API.swift
//  WisataKu
//
//  Created by Erlangga Anugrah Arifin on 13/08/22.
//

import Foundation
import SDWebImage
import Alamofire
import SwiftyJSON

struct Status {
    let error: Bool
    let message: String
    let count: Int
    let places: [Destination]
}

struct Destination: Identifiable {
    let id: Int
    let name: String
    let description: String
    let address: String
    let longitude: Double
    let latitude: Double
    let like: Int
    let image: String
}

class observer: ObservableObject {
    @Published var datas = [Destination]()
    
    init() {
        AF.request("https://tourism-api.dicoding.dev/list").responseData { (data) in
            let json = try! JSON(data: data.data!)
            for i in json["places"] {
                // 0 represents json index ; 1 represents json data
                self.datas.append(Destination(id: i.1["id"].intValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, address: i.1["address"].stringValue, longitude: i.1["longitute"].doubleValue, latitude: i.1["latitude"].doubleValue, like: i.1["like"].intValue, image: i.1["image"].stringValue))
//                print(i.1)
            }
        }
    }
}

