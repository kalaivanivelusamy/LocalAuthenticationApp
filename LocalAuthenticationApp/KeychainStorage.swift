//
//  KeychainStorage.swift
//  LocalAuthenticationApp
//
//

import SwiftUI
import KeychainAccess

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    
    let key: String
    @State private var value: String
    
    init(wrappedValue: String = "", _ key: String) {
        self.key =  key
        let initialValue = try? (Keychain().get(key)) ?? wrappedValue
        self._value = State<String>(initialValue: initialValue ?? "")
    }
    
    var wrappedValue: String {
        get { value }
        
        nonmutating set {
            value = newValue
            do{
                try Keychain().set(value, key: key)
            } catch let error {
                fatalError("\(error)")
            }
        }
    }
    
}
