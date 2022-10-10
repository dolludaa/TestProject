//
//  Model.swift
//  TestProject
//
//  Created by Людмила Долонтаева on 10.10.2022.
//

import Foundation

struct SectionList: Decodable {
    let sections: [Section]
}

struct Section: Decodable {
    let id: String
    let header: String
    let items: [SectionItem]
}
struct SectionItem: Decodable {
    
    let id: String
    let image: SectionImage
    let title: String
}
struct SectionImage:Decodable{
    private enum CodingKeys : String, CodingKey {
        case x1 = "1x"
        case x2 = "2x"
        case x3 = "3x"
    }
    let x1: String
    let x2: String
    let x3: String
}


func loadJson(filename SectionData: String) -> SectionList? {
    if let url = Bundle.main.url(forResource: SectionData, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(SectionList.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
