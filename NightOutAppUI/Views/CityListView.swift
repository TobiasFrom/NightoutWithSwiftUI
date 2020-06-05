//
//  CityList.swift
//  NightOutAppUI
//
//  Created by iMac on 27/04/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var store = CityRepo()
    @ObservedObject var vStore = VenueRepo()
    
    var body: some View {
            NavigationView {
                List {ForEach(store.cities) { city in
                    NavigationLink(destination: VenueListView()) {
                            CityListCell(city: city)
                            
                        }
                    .listRowBackground(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                }
                .navigationBarTitle(Text("Select City"), displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    nc.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    nc.navigationBar.isHidden = false
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
                    
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct CityListCell: View {
    let city: City
    
    var body: some View {
        ZStack {
            Image(city.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 140, alignment: .center)
                .background(Color(.black))
                .cornerRadius(20)
            
            VStack {
                Text(city.name)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}


