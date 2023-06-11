//
//  Dashboard.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct Dashboard: View {
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
                    //                NavigationLink(destination: NewActivityView()) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .padding()
                }
            }
            ScrollView {
                ZStack {
                    //MARK: Week Calendar View
                    VStack(spacing: 0) {
                        HStack {
                            Text(activityModel.extractDate(date: activityModel.currentWeek.first!, format: "MMM yyyy"))
                                .font(.system(size: 22))
                            Image(systemName: "chevron.down")
                        }
                        .onTapGesture {
                            print("show modal")
                        }
                        HStack(spacing: 0) {
                            Image(systemName: "chevron.left")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(activityModel.currentWeek, id: \.self) { day in
                                        VStack(spacing: 15) {
                                            Text(activityModel.extractDate(date: day, format: "E"))
                                                .font(.system(size: 15))
                                            Text(activityModel.extractDate(date: day, format: "dd"))
                                                .font(.system(size: 15, weight: .semibold))
                                                .foregroundColor(activityModel.isToday(date: day) ? .black : Color("empty-gray"))
                                                .background(
                                                    ZStack {
                                                        if activityModel.isToday(date: day) {
                                                            Circle()
                                                                .frame(width: 40, height: 40)
                                                                .foregroundColor(Color("blue2"))
                                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                                        }
                                                    }
                                                )
                                        }
                                        .frame(width: 35, height: 90)
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            withAnimation {
                                                activityModel.currentDay = day
                                            }
                                            print(activityModel.currentDay)
                                        }
                                    }
                                }
                                .padding(.horizontal)
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

