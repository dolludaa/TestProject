//
//  SectionService.swift
//  TestProject
//
//  Created by Людмила Долонтаева on 12.10.2022.
//

import Foundation

class SectionService {
    func getSectionList(filename SectionData: String) -> SectionList? {
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
    
}

