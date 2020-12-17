//
//  eAddViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 15.10.2020.
//

import UIKit

class eAddViewController: UIViewController {
    
    var labelText: String?
    
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = labelText
    }

}
