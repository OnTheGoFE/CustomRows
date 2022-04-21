//
//  DetailCellView.swift
//  EurekaDemo
//
//  Created by Jonathan Viloria M on 21/04/22.
//

import Foundation
import Eureka

public class DetailCellView: UIViewController, TypedRowControllerType{
    
    public var row: RowOf<String>!
    public var onDismissCallback : ((UIViewController) -> ())?
    
    @IBOutlet weak var btnReturn: UIButton!
    @IBOutlet weak var inptText: UITextField!
    
    @IBAction func btnReturnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.onDismissCallback?(self)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("Init DetailCellViewcontroller")
        inptText.placeholder = "Escriba algo aquí"
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
