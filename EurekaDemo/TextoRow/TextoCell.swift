//
//  TextoCell.swift
//  EurekaDemo
//
//  Created by Jonathan Viloria M on 20/04/22.
//

import Foundation
import Eureka

public class TextoCell: Cell<String>, CellType {
    
    var genericRow: TextoRow! {return row as? TextoRow}
    var controller: DetailViewController? = nil
    @IBOutlet weak var btntest: UIButton!
    @IBAction func testAction(_ sender: Any) {
        print("Test Action printed")
        
        //self.genericRow.hidden = true
        //self.genericRow.evaluateHidden()
        
        //self.genericRow.disabled = true
        //self.genericRow.evaluateDisabled()

        print(self.genericRow.isValid)
        //self.formViewController()?.present(controller!, animated: true, completion: nil)
    }
    
    override open func update() {
        super.update()
    }
    
    // MARK: - INIT
    public required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func setup() {
        super.setup()
        
        self.controller = DetailViewController(nibName: "DetailViewController", bundle: .main)
        self.controller?.modalPresentationStyle = .overCurrentContext
        self.controller?.row = genericRow
        
    }
    
    open override func didSelect() {
        super.didSelect()
        row.deselect()
        
        let controller = DetailCellView(nibName: "DetailCellView", bundle: .main)
        controller.modalPresentationStyle = .fullScreen
        controller.row = genericRow
        
        genericRow?.presentationMode = .show(controllerProvider: ControllerProvider.callback {
            return controller
        }, onDismiss: { vc in
            print("Getting info from ViewController")
            print("Valor: \((vc as! DetailCellView).inptText.text ?? "nil value")")
            vc.dismiss(animated: true)
        })
        
        if !genericRow.isDisabled {
            if let presentationMode = genericRow?.presentationMode {
                if let controller = presentationMode.makeController(){
                    presentationMode.present(controller, row: genericRow, presentingController: self.formViewController()!)
                    genericRow.onPresentCallback?(self.formViewController()!, controller as! SelectorViewController<SelectorRow<TextoCell>>)
                } else {
                    presentationMode.present(nil, row: genericRow, presentingController: self.formViewController()!)
                }
            }
        }
        
    }
    
    // MARK: - PROTOCOLS FUNCTIONS
    open override func cellCanBecomeFirstResponder() -> Bool {
        return !row.isDisabled
    }
    
}


