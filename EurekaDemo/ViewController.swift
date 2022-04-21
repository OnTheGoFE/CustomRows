//
//  ViewController.swift
//  EurekaDemo
//
//  Created by Jonathan Viloria M on 20/04/22.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        form +++ Section("Section1")
                    <<< TextRow(){ row in
                        row.title = "Text Row"
                        row.placeholder = "Enter text here"
                    }
                    <<< PhoneRow(){
                        $0.title = "Phone Row"
                        $0.placeholder = "And numbers here"
                    }
                    <<< TextoRow("ABC")
        print("Wait")
        
    }

}

