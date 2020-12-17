//
//  eAddCameraViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 10.11.2020.
//

import UIKit

class eAddCameraViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = labelText
        // Do any additional setup after loading the view.
    }
}
