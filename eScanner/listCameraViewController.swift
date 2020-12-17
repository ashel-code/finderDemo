//
//  listCameraViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 10.11.2020.
//

import UIKit


class listCameraViewController: UIViewController  {
    
    @IBOutlet weak var labelMain: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            topLabel.text = "something"
        labelMain.text = temp2
    }
        // Do any additional setup after loading the view.
}
