//
//  UserProfile.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            Text("This is your profile!")
        }.navigationBarItems(trailing:
            NavigationLink(destination: HomeView()) {
                Text("Logout")
            }
        )
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
