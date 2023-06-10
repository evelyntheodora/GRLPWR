//
//  ReflectionView.swift
//  GRLPWR
//
//  Created by Raja Monica on 03/06/23.
//

import SwiftUI

struct ReflectionView: View {
    @State var selectedReflection1 = true
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("yellow")
                    .edgesIgnoringSafeArea(.all)
                    
                    
            VStack{
                VStack{
                    Image("reflection")
                    
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                }
                VStack{
                    Text("How was the engagement")
                    Text("of the students in this activity?")
                    
                }
                //.padding()
                .fontWeight(.bold)
                .font(.title2)
                VStack{
                    RadioButtonTest()
                }
                
                VStack{
                    HStack{
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        
                        
                    }
                    .padding()
                    
                }
                // Spacer()
                .padding()
                VStack{
                    //                    Button(action: {
                    //                    }, label: {
                    //                        Text("Next")
                    //                            .font(.headline)
                    //                            .fontWeight(.semibold)
                    //                            .foregroundColor(.white)
                    //                            .padding()
                    //                            .padding(.horizontal,145)
                    //                            .background(Color.gray
                    //                                .cornerRadius(12))
                    //                    })
                    NavigationLink(
                        destination:
                            ReflectionView2()
                            .navigationTitle("Reflection")
                        ,
                        label: {
                            Text("Next")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal,145)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(red: 235/255, green: 130/255, blue: 91/255)))
                            
                        })
                }
                
                
            }
           
        }
        }
    }
}

struct RadioButton<Tag, CircleButton, Label>: View
where Tag: Hashable, CircleButton : View, Label : View {
    
    let tag: Tag
    @Binding var selection: Tag?
    @ViewBuilder let button: (Bool) -> CircleButton
    @ViewBuilder let label:() -> Label
    
    var body: some View{
        Button {
            selection = tag
        } label: {
            HStack{
                button(selection == tag)
                label()
                    .padding(.horizontal,10)
                   
            }
            
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
              .background(.white)
              .cornerRadius(12)
        Spacer()
    }
       
}


struct RadioButtonGroup<Tag, CircleButton, Label>: View
where Tag : Hashable, CircleButton : View, Label : View {
  @Binding var selection: Tag?
  let orientation: Orientation
  let tags: [Tag]
  @ViewBuilder let button: (Bool) -> CircleButton
  @ViewBuilder let label: (Tag) -> Label

  var body: some View {
    if orientation == .horizonal {
      HStack(alignment: .top) {
        radioButtons
      }
    } else {
      VStack(alignment: .leading) {
        radioButtons
      }
    }
          
  }
       
  @ViewBuilder private var radioButtons: some View {
    ForEach(tags, id: \.self) { tag in
      RadioButton(tag: tag, selection: $selection, button: button) {
        label(tag)
      }
    }
  }

  enum Orientation {
    case horizonal, vertical
  }
}

struct RadioButtonTest: View {
  @State private var selection: Option?

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RadioButtonGroup(selection: $selection,
                       orientation: .vertical,
                       tags: Option.allCases,
                       button: { isSelected in
        ZStack {
          Circle()
                .foregroundColor(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black,lineWidth:1.5))
            .frame(width: 20, height: 20)
            
          if isSelected {
            Circle()
              .foregroundColor(Color.black)
              .frame(width: 14, height: 14)
              
          }
        }
      },
                       label: { tag in
        Text("\(tag.description)")
          
      })
      
      
//      Text("The selection is: \(selection?.description ?? "None")")
//        .frame(maxWidth: .infinity)
      .padding()
        
    }
    
   
    
    
  }
        
  enum Option: CaseIterable, CustomStringConvertible {
    case first, second, third

    var description: String {
      switch self {
      case .first:
        return "Very well, they actively participated throughout the whole activity"
      case .second:
        return "Good, they showed a sign of interest and participated enough in the activity"
      case .third:
        return "Poor, they didn't seem to be interested and weren't participating fully"
      }
    }
  }
}





struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}

