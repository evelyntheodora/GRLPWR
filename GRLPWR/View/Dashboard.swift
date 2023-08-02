//
//  Dashboard.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct Dashboard: View {
    @State var yourActivityCount: Int = 0
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Hello!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Don't forget to make your plans")
                    }
                    Spacer()
                    NavigationLink(destination: NewActivityView()) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding()
                    }
                }
                ScrollView {
                    ZStack {
                        Rectangle()
                            .stroke(Color.black)
                            .frame(width: 358, height: 120)
                        
                        Text("Insert Calendar Here")
                            //            calendar view
                    }
                    VStack {
                        NavigationLink {
                            MatriksView()
                        } label: {
                            ActivityCardView(activity: activityData[3])

                        }

                        ActivityCardView(activity: activityData[4])
                    }
                    .padding(.bottom)
                    
                //                MARK: - Your Activity
                    HStack {
                        Text("Your Activities (\(yourActivityCount))")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink {
                            AllActivityView()
                        } label: {
                            Text("See all")
                        }
                    }
                    VStack {
                        ActivityCardView(activity: activityData[0])
                        ActivityCardView(activity: activityData[1])
                    }
                    
                }
            }
            .padding()
        }
        
    }
}

struct Dashboards: View {
    @State var yourActivityCount: Int = 0
    @StateObject var activityModel: ActivityViewModel = ActivityViewModel()
    @Namespace var animation
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Hi, Gogon!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Don't forget to make your plans")
                    }
                    Spacer()
                    NavigationLink(destination: NewActivityView()) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding()
                    }
                }
                ScrollView {
                    ZStack {
                        Rectangle()
                            .stroke(Color.black)
                            .frame(width: 358, height: 120)
                        
                        Text("Insert Calendar Here")
                            //            calendar view
                    }
                    VStack {
                        ForEach(0..<activityData.count, id: \.self) { index in
                            if activityData[index].isTodayActivity {
                                ActivityCardView(activity: activityData[index])
                            }
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                VStack {
                    ForEach(activityModel.storedActivity, id: \.self) { activity in
                        if Calendar.current.isDate(activity.activityDate, inSameDayAs: Date()) {
                            ActivityCardView(activity: activity)
                        }
                    }
                }
                .padding(.bottom)
                
                //                MARK: - Your Activity
                HStack {
                    Text("Your Activities (\(yourActivityCount))")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink {
                        //                        AllActivityView()
                    } label: {
                        Text("See all")
                    }
                }
                VStack{
                    //                        ForEach untuk activity
                    //                        ForEach(0..<activityData.count, id: \.self) { index in
                    //                            if !activityData[index].isTodayActivity {
                    //                                ActivityCardView(activity: activityData[index])
                    //                            }
                    //                        }
                    //                        .padding(.bottom)
                }
                
            }
        }
        .padding()
    }
    
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}

