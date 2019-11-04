//
//  ReservationFilterView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ReservationFilterView: View {
    var body: some View {
        VStack {
            Button(action: {
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            }) {
                
                HStack {
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color.orange)
                     Text("Party of 3")
                        .font(.caption)
                        .foregroundColor(Color.black)
                        .padding(.trailing, 15)
                                        
                    Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.orange)
                    Text("Fri 11/8")
                        .font(.caption)
                        .foregroundColor(Color.black)
                    
                }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            }
        }
//        .padding(.top, 5)
    }
}

