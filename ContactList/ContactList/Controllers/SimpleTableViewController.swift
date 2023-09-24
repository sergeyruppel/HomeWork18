//
//  PersonsTableViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 14.09.2023.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    var persons = Person.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.getPersons().count
    }

    // Configure the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let firstName = persons[indexPath.row].firstName
        let lastName = persons[indexPath.row].lastName
        
        cell.textLabel?.text = "\(firstName) \(lastName)"
        return cell
    }

    // Reorder cells
//    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let movedObject = self.persons[sourceIndexPath.row]
//        persons.remove(at: sourceIndexPath.row)
//        persons.insert(movedObject, at: destinationIndexPath.row)
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            persons.remove(at: indexPath.item)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//        }
//    }
//



 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        
//        
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
    }



    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }



    // MARK: - Navigation

    
//    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier != "Detail" {
//    return
//    if let indexPath = tableview.indexPathForSelectedRow,
//       let detailVC = segue.destination as? DetailsviewController {
//        detailVC.
//    }
}
