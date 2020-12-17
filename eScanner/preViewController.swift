//
//  preViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 22.10.2020.
//

import UIKit

class preViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    let eClasses = ["class1", "class2", "class3", "class4", "class5", "class6", "class7", "class8"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "classSegue" {
            let selectedCellIndexRow = tableView.indexPathForSelectedRow!.row
            (segue.destination as! listViewController).eClass = eClasses[selectedCellIndexRow]
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eClasses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "preCellId", for: indexPath)
        cell.textLabel?.text = eClasses[indexPath.row]
        //][cell.detailTextLabel?.text = eClassesDescr[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
