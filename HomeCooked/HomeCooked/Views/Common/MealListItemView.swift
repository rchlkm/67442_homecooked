//
//  MealListItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealListItemView: View {
    var listItemViewType: String// = "search"
    let meal: Meal
    let reservation: Reservation?
    let search_guest_count: Int
    //    let chef_name: String
    var frame_size: CGFloat = UIScreen.main.bounds.width - 48
    
    init(type: String, meal: Meal, reservation: Reservation?, search_guest_count: Int = 1) {
        self.listItemViewType = type
        self.meal = meal
        self.reservation = reservation
        self.search_guest_count = search_guest_count
    }
    
    var body: some View {
        NavigationLink(destination: getItemDesinationView()) {
            
            HStack {
//              ImageView(urlString: self.meal.images[0])
                Image(meal.name).resizable()
                    .frame(width: frame_size/2)//, height: frame_size/2)
//                    .border(Color.red)

                mealInfoText()
                    .frame(width: frame_size/2)
            }
        }
        .frame(width: frame_size, height: frame_size/2)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
    
    func getItemDesinationView() -> AnyView {
        switch listItemViewType {
        case "search": return AnyView(MealDetailsView(meal: self.meal, search_guest_count: self.search_guest_count))
        case "bookedMeal": return AnyView(BookedMealDetailView(reservation: self.reservation!, meal: self.meal))
        default: return AnyView(SearchItemView(meal: self.meal))
        }
    }
    
    func mealInfoText() -> AnyView {
        switch listItemViewType {
        case "search": return AnyView(SearchItemView(meal: self.meal))
        case "bookedMeal": return AnyView(BookedMealItemView(meal: self.meal, reservation: self.reservation!))
        default: return AnyView(SearchItemView(meal: self.meal))
        }
    }
    
}

                
//                RoundedRectangle(cornerRadius: 20)
//                    .frame(width: frame_size/2)
//                    .foregroundColor(OrangeColor)
                //                Image(meal.images[0]).frame(width: frame_size/2)
                
