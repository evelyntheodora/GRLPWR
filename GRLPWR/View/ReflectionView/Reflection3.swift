//
//  Reflection3.swift
//  GRLPWR
//
//  Created by Raja Monica on 11/06/23.
//

import SwiftUI

struct Reflection3: View {
    @State var selectedOption =  ""
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 250/255, green: 229/255, blue: 97/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    VStack{
                        Image("reflection")
                        
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    VStack{
                        Text("How was the engagement")
                        Text("of the students in this activity?")
                    }
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                    VStack {
                        
                            ForEach(reflection3, id: \.self) { option in
                                Button(action: {
                                    selectedOption = option
                                }) {
                                    HStack {
                                        Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding()
                                        
                                        Text(option)
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing,50)
                                        Spacer()
                                        
                                        
                                    }
                                    .foregroundColor(.black)
                                    .frame(width: 370, height: 80)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    
                                }
                            }
                        
                    }
                    
                    Spacer()
                    VStack{
                        HStack{
                            Circle()
                                .frame(width: 12,height: 12)
                                .foregroundColor(.gray).opacity(0.2)
                            Circle()
                                .frame(width: 12,height: 12)
                                .foregroundColor(.gray).opacity(0.2)
                            Circle()
                                .frame(width: 12,height: 12)
                                .foregroundColor(.gray)
                            Circle()
                                .frame(width: 12,height: 12)
                                .foregroundColor(.gray).opacity(0.2)
                            
                            
                        }
                        .padding()
                        
                    }
                    //Spacer()
                    
                    //button next
                    VStack{
                        NavigationLink(destination: Reflection4()) {
                                            Text("Next")
                                                .padding()
                                                .padding(.horizontal,140)
                                                .background(
                                                    self.selectedOption !=  "" ?
                                                   // Color.yellow :
                                                    Color(red: 255/255, green: 138/255, blue: 72/255):
                                                        Color.gray
                                                )
                                                .foregroundColor(.white)
                                                .cornerRadius(12)
                                                
                                                
                                                
                                        }
                        
                        .disabled(self.selectedOption != "" ? false : true)
                    }
                    .navigationTitle("Reflection")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct Reflection3_Previews: PreviewProvider {
    static var previews: some View {
        Reflection3()
    }
}
