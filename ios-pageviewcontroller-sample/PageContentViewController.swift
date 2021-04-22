//
//  PageContentViewController.swift
//  ios-pageviewcontroller-sample
//
//  Created by Mar 9 on 2021/04/22.
//  
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    
    var contentNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let contentNumber = contentNumber else { return }
        
        label1.text = "\(contentNumber + 1)枚目"
        label1.textAlignment = .center
    }
}
