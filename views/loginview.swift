//
//  loginview.swift
//  RKO
//
//  Created by Sachitha Sulakkhana on 2022-03-13.
//

import SwiftUI






struct loginview: View {
    
    @StateObject var LoginViewModel = loginviewmodel()

    @State var user = usermodel()
    
    @State private var isActiveLinkSignUp = false
    
    var body: some View {
        NavigationView{
            ScrollView {

                VStack(spacing: 16) {
                    Spacer()
                    Button {
                    } label: {
                        Image("NIBMImage")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                    }
                    
                    Spacer()
                    Group {
                        TextField("Email", text: $user.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $user.password)
                    }
                    .padding(12)
                    .background(Color.blue)
                    
                    HStack{
                        Spacer()
                        Spacer()
                     //   Button {
//                            viewModel.forgotPassword(email: email)
//                        } label: {
//                            Text("Forgot Password?")
//                        }
//                    }
//                    Text(viewModel.forgotPassword)
//                        .foregroundColor(Color.red)
//                        .fontWeight(.bold)
                    
//                    Text(viewModel.signInErrorMessage)
//                        .foregroundColor(Color.red)
//                        .fontWeight(.bold)
//
//                    Button(action: {
//                        viewModel.signIn(credentialModel: credentialModel)
                        
//                    }, label: {
//                        HStack {
//                            Spacer()
//                            Text("SIGN IN")
//                                .foregroundColor(.black)
//                                .padding(.vertical, 10)
//                                .font(.system(size: 18, weight: .semibold))
//                            Spacer()
//                        }.background(Color.green)
//                            .cornerRadius(15)
//
//                    })
//                }
                .padding()
                Button ("looogin"){
                                       // viewModel.signUp(userModel: userModel)
                    
                    do {
                        try user.signInValidate()
                        LoginViewModel.login(email: user.email, password: user.password )
                    } catch {
                      
                        LoginViewModel.errorMessageLogin = error.localizedDescription
                        LoginViewModel.errorAlert = true
                    }
                }//,width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                    .alert(isPresented: $LoginViewModel.errorAlert) { () -> Alert in
                        Alert(title: Text(LoginViewModel.errorMessageLogin))
                
                
//                Spacer()
//                Text("---------------------- OR ----------------------")
//                    .foregroundColor(Color.black)
//                Spacer()
//                NavigationLink("Create Account", destination: SignUpView())
//                    .foregroundColor(Color.blue)
//                Spacer()
//                NavigationLink("Terms and Conditions", destination: SignUpView())
//                    .foregroundColor(Color.black)

                    }
           
            
                        
                    
                        
//                        NavigationLink(destination: homeview()
//                                        .navigationBarHidden(true)
//                                        .navigationBarBackButtonHidden(true), isActive:$LoginViewModel.isActiveLinkSignIn)
                        
                        
                            .navigationTitle("SIGN IN")
                            .background(Color(.init(white: 0, alpha: 0.20))
                                            .ignoresSafeArea())
                        
        }
            
    }
}

}
    }
}

struct loginview_Previews: PreviewProvider {
    static var previews: some View {
        loginview()
    }
}
