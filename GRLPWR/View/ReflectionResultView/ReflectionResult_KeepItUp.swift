//
//  ReflectionResult_KeepItUp.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct ReflectionResult_KeepItUp: View {
    @State var reflection21: String = ""
    @State var reflection22: String = ""
    var body: some View {
        ZStack (alignment: .top) {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            Image ("keepItUp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text ("Keep It Up!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 56.0)
                        .padding()
                    
                    Text ("It seems like you faced some challenges but you still managed to conduct a great activity.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.top, -20.0)
                        .padding(.trailing, 40.0)
                    
                    Text ("Let’s share some more thoughts down here for future improvement.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -24.0)
                        .padding()
                        .padding(.trailing, 40.0)
                }
                
                VStack {
                    Text("What went well in this activity?")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Write your thought here", text: $reflection21, axis: .vertical)
                        .lineLimit(5...5)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .padding(.top, -20.0)
                    
                    
                }
                VStack {
                    Text("What can you do better next time?")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Write your thought here", text: $reflection22, axis: .vertical)
                        .lineLimit(5...5)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .padding(.top, -20.0)
                }
                Spacer()
                
                Button {
                    
                }
            label: {
                Text ("Save")
                    .foregroundColor(.white)
                    .frame(maxWidth: 327, maxHeight: 45)
                    .background(Color("orange"))
                    .cornerRadius(10)
                }

            }
        }
    }
}

struct ReflectionResult_KeepItUp_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionResult_KeepItUp()
    }
}
