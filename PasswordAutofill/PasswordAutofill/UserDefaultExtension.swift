//
//  UserDefaultsExtension.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//


import Foundation

extension UserDefaults {
    
    var username: String? {
        get {
            return string(forKey: "username")
        }
        set {
            set(newValue, forKey: "username")
            synchronize()
        }
    }

}
