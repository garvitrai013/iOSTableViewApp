//
//  ViewController.swift
//  TableView
//
//  Created by Garvit K Rai on 06/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countriesTableView: UITableView!
    
    let cities = ["Paris", "London", "Rome", "New York City", "Barcelona", "Istanbul", "Tokyo", "Singapore", "Bangkok", "Rio de Janerio"]
    
    let countries = [  "Paris": "France", "London": "United Kingdom", "Rome": "Italy", "New York City": "United States", "Barcelona": "Spain", "Istanbul": "Turkey", "Tokyo": "Japan", "Singapore": "Singapore", "Bangkok": "Thailand", "Rio de Janerio": "Brazil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    struct Constants {
        static let cellIdentifier = "MyTableView"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var contentConfiguration = tableViewCell.defaultContentConfiguration()
        contentConfiguration.text = cities[indexPath.row]
        contentConfiguration.secondaryText = countries[cities[indexPath.row]]
        tableViewCell.contentConfiguration = contentConfiguration
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
