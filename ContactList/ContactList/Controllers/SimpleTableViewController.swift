//
//  PersonsTableViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 14.09.2023.
//

import UIKit

final class SimpleTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    // Number of rows
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.persons.count
    }
    
    // Configure the cell
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        
        let firstName = DataManager.shared.persons[indexPath.row].firstName
        let lastName = DataManager.shared.persons[indexPath.row].lastName
        
        cell.textLabel?.text = "\(firstName) \(lastName)"
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManager.shared.persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView,
                            canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView,
                            moveRowAt fromIndexPath: IndexPath,
                            to: IndexPath) {
        let currentPerson = DataManager.shared.persons.remove(at: fromIndexPath.row)
        DataManager.shared.persons.insert(currentPerson, at: to.row)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
           let vc = segue.destination as? ProfileViewController {
            vc.index = indexPath.row
        }
    }
}
