//
//  BuildConfidence.swift
//  GRLPWR
//
//  Created by Rahmi Umarefi on 10/06/23.
//

import SwiftUI

struct BuildConfidence: View {
    @State var creativeNote: String = ""
    var body: some View {
        ZStack {
            Color("yellow")
                .edgesIgnoringSafeArea(.all)
            Image("confidence")
                .padding(.bottom, 360.0)
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("bg"))
                        .frame(height: 578)
                        .frame(width: 357)
                        .cornerRadius(20)
                        .padding(.bottom, -32)
                        .ignoresSafeArea(.container, edges: .bottom)
                        .alignmentGuide(.bottom) { _ in 0 }
                }
            }
            
            VStack (spacing: 112) {
                HStack {
                    Button {
                        // Left button action
                    } label: {
                        Image(systemName: "chevron.left")
                            .padding(.trailing)
                    }
                    
                    Text("Activity Framework")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .frame(width: 280)
                    
                    Button {
                        // Done button action
                    } label: {
                        Text("Done")
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                    }
                }
                Spacer()
                
                ScrollView {
                    VStack {
                        Text("Build learners confidence")
                            .frame(maxWidth: 325, alignment: .leading)
                            .font(.title)
                            .fontWeight(.medium)
                            .font(.system(size: 25))
                            .padding(.bottom, 12)
                        
                        Text("Help learners to build their confidence by presenting what they have been working on")
                            .frame(maxWidth: 325, alignment: .leading)
                            .font(.system(size: 16))
                            .padding(.bottom, 8)
                        
                        Text("Things that can be done to help learners build confidence")
                            .frame(maxWidth: 325, alignment: .leading)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        
                        Text("Choose one or more")
                            .frame(maxWidth: 325, alignment: .leading)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 279)
                                .frame(width: 326)
                                .cornerRadius(20)
                            Text("check box here")
                        }
                        TextField("Write your thought here", text: $creativeNote, axis: .vertical)
                            .lineLimit(4...4)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 326)
                            .cornerRadius(20)
                            .padding()
                            .padding(.top, -10.0)
                        
                    }
                }
            }
        }
    }
}

struct BuildConfidence_Previews: PreviewProvider {
    static var previews: some View {
        BuildConfidence()
    }
}
