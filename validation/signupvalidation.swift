//
//  signupvalidation.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//

import Foundation



enum signupvalidation: LocalizedError {
    case missingName
    case patternName
    case missingEmail
    case patternEmail
    case missingNic
    case patternNic
    case missingPassword
    //case misssinglocation

    var errorDescription: String? {
        switch self {
        case .missingName:
            return "You have to Provide a name"
        case .patternName:
            return "You have to Provide a Valid name"
        case .missingEmail:
            return "You have to Provide a Email"
        case .patternEmail:
            return "You have to Provide a Valid Email"
        case .missingNic:
            return "You have to Provide a NIC"
        case .patternNic:
            return "You have to Provide a Valid NIC"
        case .missingPassword:
            return "You have to Provide a Password"

            
            
        }
    }
}
