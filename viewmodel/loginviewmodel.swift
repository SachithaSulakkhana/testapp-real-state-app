//
//  loginviewmodel.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//

import Foundation
import Firebase


class loginviewmodel: ObservableObject {
    
    private var db = Firestore.firestore()
    
    @Published var isActiveLinkSignIn = false
    
   // @Published var loadHome = false
    //@Published var isActiveLoginHome = false
    @Published var errorMessageLogin = ""
    @Published var errorAlert = false
    @Published var error:Error?
    @Published var signedIn = false
    private var authservice:AuthServiceProtocol
    
    init(authservice: AuthServiceProtocol = AuthService()) {
        self.authservice = authservice
    }
    
    
    func login(email:String,password:String) {
        //self.loadHome = true
        self.errorMessageLogin = ""
        self.errorAlert = false
      
      
        
        authservice.SignIn(email: email, password:password){ result in
                            switch result{
                            case .success:
                                DispatchQueue.main.async {
                                    print("User signs in successfully")
                                    self.signedIn = true
                                }
                            case let .failure(error):
                                self.error = error
                                self.errorMessageLogin = error.localizedDescription
                                self.errorAlert = true
                            }
    }
    }
}
