//
//  ContentView.swift
//  NightOutAppUI
//
//  Created by iMac on 23/04/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showLoginMenu: Bool
    @State var showCityList = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                Spacer()
                Image("NightOut_color_with_text")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)


                VStack (spacing: 20) {
                    Button(action: { self.showCityList.toggle() }) {
                        Text("Select Your City")
                            .foregroundColor(Color.black)
                            .frame(width: 275, height: 40, alignment: .center)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 1)
                    }
                    .sheet(isPresented: $showCityList){
                        CityListView()
                        }
                    Spacer()
                    
                    LoginButton(showLoginMenu: $showLoginMenu)
                    
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showLoginMenu: .constant(false))
    }
}



