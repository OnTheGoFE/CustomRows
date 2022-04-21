//
//  TextoRow.swift
//  EurekaDemo
//
//  Created by Jonathan Viloria M on 20/04/22.
//

import Foundation
import Eureka

public class _TextoRow: Row<TextoCell>, KeyboardReturnHandler{
    /// Configuration for the keyboardReturnType of this row
    open var keyboardReturnType: KeyboardReturnTypeConfiguration?
    open var presentationMode: PresentationMode<UIViewController>?
    open var onPresentCallback: ((FormViewController, SelectorViewController<SelectorRow<Cell>>) -> Void)?
    
    public required init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = { [unowned self] value in
            guard let v = value else { return nil }
            self.value = String(describing: v)
            return String(describing: v)
        }
        cellProvider = CellProvider<TextoCell>(nibName: "TextoRow", bundle: .main)
        
    }
    open override func customDidSelect() {
        super.customDidSelect()
    }
    
    
}

public final class TextoRow: _TextoRow, RowType { }
