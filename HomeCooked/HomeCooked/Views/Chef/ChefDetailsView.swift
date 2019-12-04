//
//  ChefDetailsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/19/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ChefDetailsView: View {
    let chef: Chef
    init(chef: Chef) {
        self.chef = chef
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Hi, I'm \(chef.first_name)!")
                    .font(.title)
                Spacer().frame(height: 20.0)
                reviews
                
                
            }
        }
    }
    
    var reviews: some View {
        VStack(alignment: .leading) {
            Text("Reviews" + " (5)")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text("4.7")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }
        }.padding(.top, 5)
    }
}

struct ChefDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChefDetailsView(chef: chef1)
    }
}
