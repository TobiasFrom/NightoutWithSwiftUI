//
//  NavigationBarColor.swift
//  NightOutAppUI
//
//  Created by iMac on 27/04/2020.
//  Copyright © 2020 nightout. All rights reserved.
//

import SwiftUI

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
