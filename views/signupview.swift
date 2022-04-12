//
//  signupview.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//

import SwiftUI
import CoreLocation


struct signupview: View {
    
    @StateObject var SignUpViewModel = signupviewmodel()
    //@StateObject var localSignUpViewModel = signupviewmodel()
    
    
    @State var user = usermodel()
    @State private var isActiveLinkSignIn = false
    @State var manager = CLLocationManager()
    @State private var dob = Date()

    var body: some View {
    
        NavigationView{
            ScrollView {
                VStack(spacing: 16) {
                    Spacer()
                    Group {
                        TextField("Full Name", text: $user.name)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        TextField("NIC No", text: $user.nic)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                      
                        TextField("Email", text: $user.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        SecureField("Password", text: $user.password)
                      

                    .padding(12)
                    .background(Color.blue)
//                    
//                    Text(viewModel.signUpErrorMessage)
//                        .foregroundColor(Color.red)
//                        .fontWeight(.bold)
                    
                    Spacer()
                    Button ("Submit"){
                                           // viewModel.signUp(userModel: userModel)
                        
                        do {
                            try user.signUpValidate()
//                            $SignUpViewModel.SignUp(name: user.name, nic: user.nic, password: user.password, email: user.email)
                        } catch {
                          
                            SignUpViewModel.errorMessageSignUp = error.localizedDescription
                            SignUpViewModel.errorAlertSignUp = true
                        }
                    }//,width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                        .alert(isPresented: $SignUpViewModel.errorAlertSignUp) { () -> Alert in
                            Alert(title: Text(SignUpViewModel.errorMessageSignUp))
                            
                            
//
//                    NavigationLink(destination: loginview()
//                                    .navigationBarHidden(true)
//                                    .navigationBarBackButtonHidden(true), isActive:$SignUpViewModel.isActiveLinkSignIn)
//
//
                            
                     
                            
                            }
                }
                    
                }
            }
        .onAppear(perform: {
            manager.delegate = SignUpViewModel

        })
    
        }
        
    }

        
//                     label: {
//                        HStack {
//                            Spacer()
//                            Text("SIGN UP")
//                                .foregroundColor(.black)
//                                .padding(.vertical, 10)
//                                .font(.system(size: 18, weight: .semibold))
//                            Spacer()
//                        }.background(Color.green)
//                            .cornerRadius(15)
//                    }
//                }
//                .padding()
//
//            }
//            .background(Color(.init(white: 0, alpha: 0.20))
//                            .ignoresSafeArea())
//        }
//        .navigationTitle("SIGN UP")
//
//
//    }
//}

struct signupview_Previews: PreviewProvider {
    static var previews: some View {
        signupview()
    }
}

