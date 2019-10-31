//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
  @State private var city: String = ""
  
  var body: some View {
    VStack{
      TextField("City", text: $city)
        .border(Color.black)
        .padding()
      Text("Search View")
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
