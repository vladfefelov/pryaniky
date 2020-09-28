//
//  TableViewController.swift
//  Pryaniky.com
//
//  Created by Vladislav Fefelov on 28.09.2020.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var jsonArray = JSON()
    var presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        jsonArray = presenter.getJSON(url: URL(string: "https://pryaniky.com/static/json/sample.json")!)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray["view"].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel!.text = "\(jsonArray["view"][indexPath.row])"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            let destVC = segue.destination as! ViewController
            
            let (url,text,dict) = presenter.decodeJSON(json: jsonArray, indexPath: indexPath!)
            destVC.imageURL = url
            destVC.text = text
            destVC.variants = dict
        }
    }

}
