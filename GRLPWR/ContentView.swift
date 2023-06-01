//
//  ContentView.swift
//  GRLPWR
//
//  Created by Evelyn Theodora Siswanto on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading) {
                Text("Hi, Gogon!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Don't forget to make your plans")
                
                Text("Insert Calendar Here")
                //            calendar view
                
                ForEach(0..<activityData.count) { index in
                    if activityData[index].isTodayActivity {
                        ActivityCardView(activity: activityData[index])
                    }
                }
                
                VStack {
                    HStack {
                        Text("Your Activities(20)")
                        Spacer()
                        Button("See all") {
                            
                        }
                        
                    }
                    ForEach(0..<activityData.count) { index in
                        if !activityData[index].isTodayActivity {
                            ActivityCardView(activity: activityData[index])
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
