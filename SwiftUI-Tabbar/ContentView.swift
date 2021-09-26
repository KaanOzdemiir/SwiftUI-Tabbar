//
//  ContentView.swift
//  SwiftUI-Tabbar
//
//  Created by Kaan Ozdemir on 26.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 2
    @State var animate = false
    var tabScreenColors: [Color] = [.blue, .orange, .red, .yellow, .green]
    var tabIcons = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        
        VStack {
            ZStack {
                NavigationView {
                    Button(action: {
                        animate.toggle()
                    }, label: {
                        Text("\(selectedIndex)")
                    })
                    .frame(width: 240, height: 240, alignment: .center)
                    .background(tabScreenColors[selectedIndex])
                    .foregroundColor(Color.white)
                    .cornerRadius(90)
                    .font(.system(size: 72, weight: .bold))
                        .tabItem {
                        Image(systemName: "person")
                    }
                        .navigationTitle("Tab \(selectedIndex)")
                    .scaleEffect(animate ? 1 : 0.7)
                    .animation(.easeIn)
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<5) { index in
                    Spacer()
                    Button(action: {
                        animate = false
                        selectedIndex = index
                    }, label: {
                        Image(systemName: tabIcons[index])
                            .font(.system(size: index == 2 ? 52 : 24, weight: .bold))
                            .foregroundColor((index == selectedIndex ? tabScreenColors[index] : Color(white: 0.8)))
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
