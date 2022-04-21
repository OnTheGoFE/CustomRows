//
//  DetailViewController.swift
//  EurekaDemo
//
//  Created by Jonathan Viloria M on 21/04/22.
//

import Foundation
import Eureka

public class DetailViewController: UIViewController, TypedRowControllerType{
    
    public var row: RowOf<String>!
    public var onDismissCallback : ((UIViewController) -> ())?
    
    @IBOutlet weak var btnReturn: UIButton!
    
    @IBAction func btnReturnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("Init Detail View Controller")
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
