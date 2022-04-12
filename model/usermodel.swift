//
//  usermodel.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//

import Foundation

//class usermodel : ObservableObject{
//
//    @Published var name = ""
//    @Published var nic = ""
////    @Published var regno = ""
////    @Published var vehicleno = ""
//    @Published var email = ""
//    @Published var password = ""
//}

//class CredentialModel : ObservableObject{
//    
//    @Published var email = ""
//    @Published var password = ""
//}


struct usermodel{
    var userId: String = ""
    var name: String = ""
    var email: String = ""
    //var vehicleNumber: String = ""
    var nic: String = ""
    var password: String = ""
    //var dob:  = ""
    
    
    //var status: String = ""
    
    
    
    


func signUpValidate() throws {
    if (name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingName
    } else if (!name.isValidName){
        throw signupvalidation.patternName
    } else if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingEmail
    } else if (!email.isValidEmail){
        throw signupvalidation.patternEmail
    } else if (nic.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingNic
    }  else if (!nic.isValidNic){
        throw signupvalidation.patternNic
    } else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingPassword
    }
//    
}

func signInValidate() throws {
    if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingEmail
    } else if (!email.isValidEmail){
        throw signupvalidation.patternEmail
    } else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingPassword
    }
}

func forgetValidate() throws {
    if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
        throw signupvalidation.missingEmail
    } else if (!email.isValidEmail){
        throw signupvalidation.patternEmail
    }
}

}



extension String {
var isValidEmail: Bool {
    NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: self)
}
var isValidNic: Bool {
    NSPredicate(format: "SELF MATCHES %@", "^([0-9]{9}[x|X|v|V]|[0-9]{12})$").evaluate(with: self)
}
var isValidName: Bool {
    NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]+").evaluate(with: self)
}
}
