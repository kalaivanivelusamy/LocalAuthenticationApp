//
//  SecretViewModel.swift
//  LocalAuthenticationApp
//
//

import Foundation
import LocalAuthentication

class SecretViewModel {
    
    func checkIfAuthenticated() {
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify Yourself"
        }
    }
}
