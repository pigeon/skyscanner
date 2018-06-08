//
//  ViewController.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import UIKit

extension UIViewController {
    
    func showError(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func show(error:NSError) {
        self.showError(title: "Error", message: error.localizedDescription)
    }
}
