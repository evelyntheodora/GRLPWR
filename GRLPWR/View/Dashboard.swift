//
//  Dashboard.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack (alignment: .leading) {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Hi, Gogon!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text("Don't forget to make your plans")
                        }
                        Spacer()
                        Button {
                            
                        }
                    label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding()
                        
                    }
                    
                    }
                    
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
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
