//
//  InfoTableViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 14.09.2023.
//

import UIKit

final class SectionTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return DataManager.shared.persons.count
    }
    
    // Number of rows
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Configure the section
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        let person = DataManager.shared.persons[section]
        let fullName = "\(person.firstName) \(person.lastName)"
        return fullName
    }
    
    override func tableView(_ tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                            forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .label
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .center
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    // Configure the cell
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)

        if indexPath.row == 0 {
            cell.textLabel?.text = DataManager.shared.persons[indexPath.section].email
        } else {
            cell.textLabel?.text = String(DataManager.shared.persons[indexPath.section].phoneNumber)
        }
        return cell
    }

}
