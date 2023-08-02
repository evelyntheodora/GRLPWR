//
//  ReflectionResult_HavingTroubles.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct ReflectionResult_HavingTroubles: View {
    @State var reflection31: String = ""
    @State var reflection32: String = ""
    var body: some View {
        ZStack (alignment: .top) {
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .edgesIgnoringSafeArea(.all)
            
            Image ("havingTrouble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text ("Having Troubles?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 56.0)
                        .padding()
                    
                    Text ("It seems like there were some struggles that you encountered but don’t let that stop you from anything!")
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
                    
                    TextField("Write your thought here", text: $reflection31, axis: .vertical)
                        .lineLimit(4...4)
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
                    
                    TextField("Write your thought here", text: $reflection32, axis: .vertical)
                        .lineLimit(4...4)
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
                    .padding(.vertical, 20.0)

                }

            }
        }
    }
}

struct ReflectionResult_HavingTroubles_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionResult_HavingTroubles()
    }
}
