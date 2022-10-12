//
//  TableView.swift
//  TestProject
//
//  Created by Людмила Долонтаева on 11.10.2022.
//
import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    let tableView = UITableView()
    let data = loadJson(filename: "SectionData")
    
    func setupStyle() {
        tableView.backgroundColor = .lightGray
        tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.rowHeight = 150
        
    }
    
