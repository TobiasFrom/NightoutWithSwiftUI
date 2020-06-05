//
//  LandingPage.swift
//  NightOutAppUI
//
//  Created by iMac on 29/04/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showLoginMenu = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            .edgesIgnoringSafeArea(.all)
            
                HomeView(showLoginMenu: $showLoginMenu)
                    
            // **Padding to Top and Clipshape is weird on phone 8 and SE - Needs fix **
                    .padding(.top, 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                    .offset(y: showLoginMenu ? -450 : 0)
                    .rotation3DEffect(Angle(degrees: showLoginMenu ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                    .scaleEffect(showLoginMenu ? 0.9 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .edgesIgnoringSafeArea(.all)
            
                LoginMenuView()
                    .background(Color.black.opacity(0.001))
                    .offset(y: showLoginMenu ? 0 : screen.height)
                    .offset(y: viewState.height)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .onTapGesture {
                        self.showLoginMenu.toggle()
                        LoginMenuView().hideKeyboard()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showLoginMenu = false
                            LoginMenuView().hideKeyboard()
                        }
                        self.viewState = .zero
                    }
                )
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
            Home()
    }
}

struct LoginButton: View {
    @Binding var showLoginMenu: Bool
    
    var body: some View {
        Button(action: { self.showLoginMenu.toggle() }) {
            Text("Login".uppercased())
            .foregroundColor(Color.black)
            .frame(width: 275, height: 40, alignment: .center)
            .background(Color(.orange))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 1)
        }
    }
}

let screen = UIScreen.main.bounds
