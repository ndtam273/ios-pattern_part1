//
//  AppSettingsViewController.swift
//  RabbleWabble
//
//  Created by TAM NGUYEN DUC on 12/3/20.
//

import UIKit

public class AppSettingsViewController: UITableViewController {
    // MARK: - Properties
    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"
    
    // MARK: - View Life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

}

// MARK: - UITableViewDatasource
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestrionStrategyType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let questionStrategyType = QuestrionStrategyType.allCases[indexPath.row]
        cell.textLabel?.text = questionStrategyType.title()
        
        if appSettings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestrionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
        
    }
}

