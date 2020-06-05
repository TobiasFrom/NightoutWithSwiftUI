//
//  CityRepo.swift
//  NightOutAppUI
//
//  Created by iMac on 05/05/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class CityRepo: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var cities: [City] = []
    
    init() {
        loadCities()
        print("Citylist Loaded")
    }
    
    func loadCities() {
        db.collection("cityList").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.cities = querySnapshot.documents.compactMap { document in
                    try? document.data(as: City.self)
                }
            }
        }
    }
}
