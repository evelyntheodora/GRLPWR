//
//  MatriksView.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 11/06/23.
//

import SwiftUI

struct MatriksView: View {
    @State var activityTitle: String = ""
    @State var dateNow = Date.now
    @State var selectedTag: [String] = ["Ulangan"]
    @State var addTag: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 30){
                    VStack(alignment: .leading){
                        Text("Activity Title")
                            .font(.title3)
                            .fontWeight(.bold)
//                        TextField("Add your activity title", text: $activityTitle)
//                            .textFieldStyle(.roundedBorder)
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray, lineWidth: 1)
                                .frame(height: 45)
                            Text("Teach geometry basics")
                                .padding(10)
                                

                        }
                        .padding(.bottom)
                        Text("Activity Objective")
                            .font(.title3)
                            .fontWeight(.bold)
//                        TextField("Add your activity title", text: $activityTitle)
//                            .textFieldStyle(.roundedBorder)
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray, lineWidth: 1)
                                .frame(height: 70)
                            Text("Students can calculate area, perimeter, volume of shapes and apply it to daily  use")
                                .padding(10)
                                

                        }
                        DatePicker(selection: $dateNow, in: ...Date.now, displayedComponents: .date) {
                            Text("Set date")
                        }
                        Button("Set tag") {
                            addTag.toggle()
                        }
                        .sheet(isPresented: $addTag) {
                            ViewTag(addTag: $addTag)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Guidelines")
                            .font(.system(.title3))
                            .fontWeight(.bold)
                        
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Your Activity")
        .toolbar {
            Button("Done") {
                
            }
        }
        
    }
}

struct MatriksView_Previews: PreviewProvider {
    static var previews: some View {
        MatriksView()
    }
}
