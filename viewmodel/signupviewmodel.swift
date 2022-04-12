//
//  signupviewmodel.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//


import Foundation
import Firebase
import CoreLocation
import GameKit
import MapKit

class signupviewmodel: NSObject,ObservableObject,CLLocationManagerDelegate {
private var db = Firestore.firestore()

@Published var errorMessageSignUp = ""
@Published var errorAlertSignUp = false
    @Published var isActiveLinkSignIn = false
    //@Published var location = ""
    
    func SignUp(name: String, nic: String, password: String, email: String ,dob:String){
        Auth.auth().createUser(withEmail: email, password: password){ (authResult, error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {

                case .emailAlreadyInUse:
                    print("Error: Email Address already used.")
                case .weakPassword:
                    print("Error: The password is week.")
                default:
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                let user = Auth.auth().currentUser
                if let user = user {
                    
                    let object :[String: Any] = [
                        "authID" : user.uid,
                        "name" : name,
                        "nic" : nic,
                        "dob" : dob,
                    ]
            
            
                    var ref: DocumentReference? = nil
                    ref = self.db.collection("User").addDocument(data:object){ err in
                        if let err = err {
                            print("Error writing document: \(err)")
                            self.errorAlertSignUp = true
                            self.errorMessageSignUp = err.localizedDescription
                            
                            
                            
                        } else {
                            
                            self.errorMessageSignUp = ""
                            self.errorAlertSignUp = false
                            
                            self.isActiveLinkSignIn=true
                            
                            print("Document successfully written!")
                            DispatchQueue.main.async {
                                print("User signs up successfully")
                                //self.signedIn = true
                               
                                
                            }
                        }
                    }
                }
            }
        }
}
    
}
//    func locationManager(_ manager:CLLocationManager,didUpdateLocations locations:[CLLocation]){
//
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//
//        let region = MKCoordinateRegion(center)
//    }
////        print("test")
////
////        let last = locations.last!
////
////         CLGeocoder().reverseGeocodeLocation(last) {(places, _) in
////            guard let placeMarks = places else {return}
////
////
////            self.location = (placeMarks.first?.name ?? "") + " , " + (placeMarks.first?.locality ?? "")
////             print(self.location)
////    }
////
////
//
//    func locationManager(_ manager:CLLocationManager,didFailWithError error: Error){
//
//
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//
//        if manager.authorizationStatus == .authorizedWhenInUse{
//            manager.requestLocation()
//
//
//        }
//    }
//
//    }
//}
