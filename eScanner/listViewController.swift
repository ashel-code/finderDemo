//
//  listViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 13.10.2020.
//

import UIKit

var temp1 = [""]
// потом так же сделать с лебелом!!!

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topLabel: UILabel!
    
    var eClass1: [String] = []
    var eClass2: [String] = []
    var eClass3: [String] = []
    var eClass45: [String] = []
    
    var eClass6: [String] = []
    var eClass7: [String] = []
    var eClass9: [String] = []
    var eClass10: [String] = []
    
    
    var eClass: String?
    var dataSource = [""]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
          super.viewDidLoad()
        topLabel.text = eClass
        if eClass == "class1" {
            temp1 = eClass1
        } else if eClass == "class2" {
            temp1 = eClass2
        } else if eClass == "class3" {
            temp1 = eClass3
        } else if eClass == "class4" {
            temp1 = eClass45
        } else if eClass == "class5" {
            temp1 = eClass6
        } else if eClass == "class6" {
            temp1 = eClass7
        } else if eClass == "class7" {
            temp1 = eClass9
        } else if eClass == "class8"{
            temp1 = eClass10
        }
        
        dataSource = temp1
      }
      
    
      //MARK: - Table View
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "eAddSegue" {
                let selectedCellIndexRow = tableView.indexPathForSelectedRow!.row
                (segue.destination as! eAddViewController).labelText = dataSource[selectedCellIndexRow]
            }
        }
    

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return dataSource.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
          cell.textLabel?.text = dataSource[indexPath.row]
          return cell
      }
  }
