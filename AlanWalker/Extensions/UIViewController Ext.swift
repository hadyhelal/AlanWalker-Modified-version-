//
//  UIViewController Ext.swift
//  AlanWalker
//
//  Created by Hady Helal on 06/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit
extension UIViewController {
    func dismissKeyBoard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(view.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}
