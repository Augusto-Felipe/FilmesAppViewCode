//
//  Alert.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Felipe Augusto Correia on 15/03/23.
//

import Foundation
import UIKit

class Alert:NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func createAlert(titulo: String, mensagem: String, completion: (() -> Void?)? = nil) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alert.addAction(cancelar)
        self.controller.present(alert, animated: true, completion: nil)
    }
}
