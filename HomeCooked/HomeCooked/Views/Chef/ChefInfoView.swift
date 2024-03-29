//
//  ChefInfoView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ChefInfoView: View {
    let chef: Chef
    init(chef: Chef) {
        self.chef = chef
    }
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle("Contact \(chef.first_name)")

            IconTextView(text: chef.phone, img: "phone.fill")
        }
    }
}
