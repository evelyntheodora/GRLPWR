//
//  ReflectionView4.swift
//  GRLPWR
//
//  Created by Raja Monica on 03/06/23.
//

import SwiftUI

struct ReflectionView4: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                 Image("reflection4")
                
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .padding()
                            }
                            VStack{
                                Text("How would you rate")
                                Text("the output of this student?")
                
                            }
                            //.padding()
                                .fontWeight(.bold)
                                .font(.title2)
            }
            VStack{
                
            }
            
        }
    }
}

struct ReflectionView4_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView4()
    }
}

