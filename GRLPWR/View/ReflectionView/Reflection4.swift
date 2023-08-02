//
//  Reflection4.swift
//  GRLPWR
//
//  Created by Raja Monica on 11/06/23.
//

import SwiftUI

struct Reflection4: View {
    @State var selectedNumber: Int = 0
    @State var showbutton: Bool = false
    
    let numbers = Array(1...10)
    
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
                            .frame(width: 160, height: 160)
                        //.padding()
                    } .padding()
                    VStack{
                        Text("How would you asses students'")
                        Text("knowledge, skill and attitude?")
                        
                    }
                    
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                    VStack{
                        
                            //tombol kotak-kotak
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))],spacing: 15){
                                ForEach(numbers, id: \.self){
                                    number in Button(action: {
                                        selectedNumber = number
                                    }){
                                        
                                        Text("\(number)")
                                            .font(.system(size:20))
                                            .foregroundColor(.black)
                                            .frame(width: 60, height: 60)
                                            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(selectedNumber == number ? .orange : .white))
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding()
                        Spacer()
                        
                        
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
                                    .foregroundColor(.gray).opacity(0.2)
                                Circle()
                                    .frame(width: 12,height: 12)
                                    .foregroundColor(.gray)
                                
                                
                            }
                            .padding()
                            
                        }
                       
                        VStack{
                            
//                                                   NavigationLink(
//                                                        destination:
//                                                        ReflectionView3()
                                                          // .navigationTitle("Reflection")
                            //                                 //  .navigationBarTitleDisplayMode(.inline)
                            //                            ,
                            //                            label: {
//                            Text("Submit")
//                                .font(.headline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .padding()
//                                .padding(.horizontal,145)
//                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(red: 235/255, green: 138/255, blue: 72/255)))
                            //  })
                            
                            VStack{
                                //Text("\(number)")
                                if selectedNumber <= 3   {
                                    NavigationLink(destination: ReflectionResult_HavingTroubles()) {
                                        Text("Submit")}
                                    //.padding()
                                } else if selectedNumber == 4 {
                                    NavigationLink(destination: ReflectionResult_KeepItUp()) {
                                        Text("Submit")}
                                } else if selectedNumber == 5 {
                                    NavigationLink(destination: ReflectionResult_KeepItUp()) {
                                        Text("Submit")}
                                } else if selectedNumber == 6 {
                                    NavigationLink(destination: ReflectionResult_KeepItUp()) {
                                        Text("Submit")}
                                } else if selectedNumber == 7 {
                                    NavigationLink(destination: ReflectionResult_KeepItUp()) {
                                        Text("Submit")}
                                } else if selectedNumber >= 8 {
                                    NavigationLink(destination: ReflectionResult_Awesome()) {
                                        Text("Submit")}
                                    
                                    
                                    
//                                    NavigationLink(destination: Home()) {
//                                        Text("Submit")
//                                            .padding()
//                                            .padding(.horizontal,140)
//                                            .background(
//                                                //                                                            self.selectedOption !=  "" ?
//                                                // Color.yellow :
//                                                Color(red: 255/255, green: 138/255, blue: 72/255)
//                                            )
//                                            .foregroundColor(.white)
//                                            .cornerRadius(12)
//
//
//
//                                    }
                                    
                                    
                                    //.disabled(selectedNumber <= 0)
                                }
                                
                            }
                            .padding()
                            .padding(.horizontal,140)
                            .background(Color(red: 255/255, green: 138/255, blue: 72/255))
                            .foregroundColor(.white).cornerRadius(12)
                            .navigationTitle("Reflection")
                            .navigationBarTitleDisplayMode(.inline)
                            .disabled(selectedNumber <= 0)
                                   // Color.yellow :
//                                    Color(red: 255/255, green: 138/255, blue: 72/255):
//                                        Color.gray
//                                )
                                
                        }
                        Spacer()
                    }
                
                
            }
        }
    }
}

struct Reflection4_Previews: PreviewProvider {
    static var previews: some View {
        Reflection4()
    }
}
