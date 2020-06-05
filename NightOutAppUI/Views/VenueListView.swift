//
//  VenueListView.swift
//  NightOutAppUI
//
//  Created by iMac on 08/05/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI
import Firebase

struct VenueListView: View {
    @ObservedObject var venueStore = VenueRepo()
    
//    @Binding var ChosenCity: String
    
//    func StoreOutput(){
//        if ChosenCity == "Copenhagen" {
//            return "venueStore.venuesCph"
//        }
//
//    }

        var body: some View {
            NavigationView {
                List {ForEach(venueStore.venuesCph){venue in
                    NavigationLink(destination: Text("hello")) {
                    VenueListCell(venue: venue)
                    
                    }
                }
            }
        }
    }
}
    
struct VenueListView_Previews: PreviewProvider {
    static var previews: some View {
        VenueListView()
//         VenueListView(ChosenCity: .constant("venuesCph"))
        
    }
}

struct VenueListCell: View {
    let venue: Venue
    
    var body: some View {
        ZStack {
            Image("ComingSoon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 140, alignment: .center)
                .background(Color(.black))
                .cornerRadius(20)
            
            VStack {
                Text(venue.name)
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
