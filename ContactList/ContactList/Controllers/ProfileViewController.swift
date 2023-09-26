//
//  ProfileViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 25.09.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        tableView.backgroundColor = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    override internal func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ChangeDataViewController {
            vc.index = index
        }
        
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int { return 4 }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        if let index = index {
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "First name: \(DataManager.shared.persons[index].firstName)"
            case 1:
                cell.textLabel?.text = "Last name: \(DataManager.shared.persons[index].lastName)"
            case 2:
                cell.textLabel?.text = "Email: \(DataManager.shared.persons[index].email)"
            case 3:
                cell.textLabel?.text = "Phone number: \(DataManager.shared.persons[index].phoneNumber)"
            default:
                cell.textLabel?.text = ""
            }
        }
        return cell
    }
    
}
