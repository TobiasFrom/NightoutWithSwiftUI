//
//  VenueRepo.swift
//  NightOutAppUI
//
//  Created by iMac on 07/05/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class VenueRepo: ObservableObject {
    @Published var db = Firestore.firestore()
    @Published var venuesCph: [Venue] = []
    @Published var venuesMal: [Venue] = []

    
    init() {
        loadVenues()
        print("venuelist loaded")
    }
    
        func loadVenues() {
            db.collection("venues").addSnapshotListener { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue loading your Playerlist from Firestore, \(e.localizedDescription)")
                } else {
                    if let snapShotDocuments = querySnapshot?.documents {
                        for doc in snapShotDocuments {
                            let data = doc.data()
                            
                            if data["city"] as? String == "Copenhagen" {
                                self.venuesCph.append(Venue(id: "test1", admin: false, name: "test1", email: "test", profilepicture: "test", profileText: "test", streetName: "test", streetNumber: "test", city: "test", postalCode: "test", phoneNumber: "test", password: "test", monday: "test", mondayClose: "test", tuesday: "test", tuesdayClose: "test", wednesday: "test", wednesdayClose: "test", thursday: "test", thursdayClose: "test", friday: "test", fridayClose: "test", saturday: "test", saturdayClose: "test", sunday: "test", sundayClose: "test"))
                            }
                                else if data["city"] as? String == "Malmö"{
                                self.venuesMal.append(Venue(id: "test2", admin: false, name: "test2", email: "test", profilepicture: "test", profileText: "test", streetName: "test", streetNumber: "test", city: "test", postalCode: "test", phoneNumber: "test", password: "test", monday: "test", mondayClose: "test", tuesday: "test", tuesdayClose: "test", wednesday: "test", wednesdayClose: "test", thursday: "test", thursdayClose: "test", friday: "test", fridayClose: "test", saturday: "test", saturdayClose: "test", sunday: "test", sundayClose: "test"))
                            }
                            else if data["admin"] as? String == "true"{
                                continue
                            } else {
                                continue
                            }
                            
                    }
                }
            }
        }
    }
}
