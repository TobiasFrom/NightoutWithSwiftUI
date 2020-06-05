//
//  LoginMenu.swift
//  NightOutAppUI
//
//  Created by iMac on 29/04/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginMenuView: View {
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Something went wrong!"

    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func PerformLogin() {
        self.hideKeyboard()
        self.isFocused = false
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            } else {
                print("Login Succes")
            }
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 20, weight: .light))
                            .imageScale(.large)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                        TextField("Email".uppercased(), text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onTapGesture {
                                self.isFocused = true
                        }
                            }
                    HStack {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 20, weight: .light))
                            .imageScale(.large)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                        SecureField("Password".uppercased(), text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onTapGesture {
                                self.isFocused = true
                        }
                        }
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                
            
    
                
                HStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Forgot Password?")
                    }
                    .padding(.leading)
                    .offset(y: 60)
                    VStack {
                        
                        Button(action: {
                                    self.PerformLogin()
                                    }) {
                                    MenuRow(title: "Sign In", icon: "lock.rotation.open")
                                    }
                                    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                                    .cornerRadius(5)
                                    .padding(.trailing)
                                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 0, y: 5)
                                    .alert(isPresented: $showAlert){
                                        Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                                    }
                        Button(action: {
                                        self.showAlert = true
                                // **isFocused is not resetting to false, Needs fix**
                                        self.hideKeyboard()
                                        self.isFocused = false
                                        
                                    }) {
                                    MenuRow(title: "Sign Up", icon: "person.crop.circle")
                                    }
                                    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                                    .cornerRadius(5)
                                    .padding(.trailing)
                                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 0, y: 5)
                                    .alert(isPresented: $showAlert){
                                        Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                                    }
                        
                    }
                    .padding(.leading)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 20)
            .overlay(
                Image("NightOut_color_no_text")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                    .offset(y: -150)
                    
            )
        }
        .padding(.bottom, 30)
        .offset(y: isFocused ? -300 : 0)
        .animation(isFocused ? .easeInOut : nil)
        .onTapGesture {
            self.isFocused = false
            self.hideKeyboard()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .padding(.leading)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading)
            
        }
    }
}
