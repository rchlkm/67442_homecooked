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
//        self.vm.getChefReviews(chef_id: chef.id) {
//            (reviews) in
//            self.chef_reviews = reviews
//        }
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
            Text("Reviews")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text("\(self.vm.getAverageRating())")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(OrangeColor)
            }
        }.padding(.top, 5)
    }
}

struct ChefDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChefDetailsView(chef: chef1)
    }
}
