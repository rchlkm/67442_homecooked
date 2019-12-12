//
//  ChefDetailsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/19/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ChefDetailsView: View {
    @ObservedObject var vm : ChefViewModel
    let chef: Chef
    @State var chef_reviews: [Review] = [Review]()
    
    init(chef: Chef) {
        self.chef = chef
        self.vm = ChefViewModel()
    }
    
    var body: some View {        
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    LargeTitle("Hi, I'm \(chef.first_name)!")
                    Spacer()
                }
                Text(chef.description)
                Spacer().frame(height: 20.0)
                reviews
            }
        }.padding(.leading,20).padding(.trailing,20)
    }
    
    var reviews: some View {
        VStack(alignment: .leading) {
            
            if (self.vm.getReviewsCount() == 0) {
                Text("I don't have any reviews yet :(")
            } else {
                Text("Reviews (\(self.vm.getReviewsCount()))")
                    .font(.title)
                    .fontWeight(.bold)
                
                Section {
                    Text("\(self.vm.getAverageRating())")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(OrangeColor)
                }
            }
        }.padding(.top, 5)
    }
}
