//
//  ViewController.swift
//  NetworkAPIPractice
//
//  Created by Abdullah AlRashoudi on 11/16/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users: [User] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId" , for: indexPath)
        cell.textLabel?.text = String(users[indexPath.row].username)
        cell.detailTextLabel?.text = users[indexPath.row].name
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        NetworkManager.shared.fetchData { [weak self] users in
            DispatchQueue.main.async {
                self?.users = users
                self?.tableView.reloadData()
            }
            
        }
    }


}

