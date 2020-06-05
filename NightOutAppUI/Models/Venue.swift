//
//  Venue.swift
//  NightOutAppUI
//
//  Created by iMac on 07/05/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Venue: Identifiable, Decodable {
    @DocumentID var id: String?
    var admin: Bool
    var name: String
    var email: String
    
    var profilepicture: String
    var profileText: String
    
    var streetName,
        streetNumber,
        city,
        postalCode,
        phoneNumber,
        password: String
    
    var monday,
        mondayClose,
        tuesday,
        tuesdayClose,
        wednesday,
        wednesdayClose,
        thursday,
        thursdayClose,
        friday,
        fridayClose,
        saturday,
        saturdayClose,
        sunday,
        sundayClose: String
    
}
