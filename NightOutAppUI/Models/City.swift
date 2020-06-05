//
//  City.swift
//  NightOutAppUI
//
//  Created by iMac on 05/05/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct City: Identifiable, Decodable {
    @DocumentID var id: String?
    var image: String
    var name: String
}


//let cityData = [
//    City(image: "Copenhagen", name: "Copenhagen"),
//    City(image: "Malmö", name: "Malmö"),
//    City(image: "ComingSoon", name: ""),
//    City(image: "ComingSoon", name: ""),
//    City(image: "ComingSoon", name: "")
//]
