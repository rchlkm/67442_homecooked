//
//  RateMealAlert.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct RateMealAlert: View {
    @State var isPresented = false
    let dismiss = Alert.Button.default(Text("OK")) {}
    var alert: Alert {
        Alert(title: Text("Rate the Meal"),
              message: Text("How many stars do you give the meal?"),
              dismissButton: dismiss)
    }
    
    var body: some View {
        Button(action: {
            self.isPresented = true
        }) {
            Image(systemName: "star.fill")
            Text("Rate Meal")
        }.alert(isPresented: $isPresented) { () -> Alert in
            alert
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}


//https://medium.com/stepstone-tech/swiftui-101-how-to-use-state-and-binding-in-your-first-custom-ui-control-64d395947492

struct RatePicker : View {
    @State var star_count: Int = 0
  
  func starButton(index:Int) -> some View {
    let imageName = index <= star_count ? "star.fill" : "star"
    let color:Color = index <= star_count ? .orange : .gray
    
    return
      Button(action: {
        self.star_count = index
      }) {
        Image(systemName:imageName)
          .imageScale(.large)
          .foregroundColor(color)
          .frame(width:24, height: 24)
    }
  }
  
    var body: some View {
      HStack {
        ForEach((1...5), id: \.self) { id in
          self.starButton(index: id)
        }
      }
    }
}

struct RatePicker_Previews: PreviewProvider {
    static var previews: some View {
        RatePicker()
//        RateMealAlert()
    }
}
