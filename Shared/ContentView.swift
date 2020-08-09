//
//  ContentView.swift
//  Shared
//
//  Created by Vitor Capretz on 2020-08-09.
//

import SwiftUI

struct ContentView: View {
    let colors = [Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1)), Color(#colorLiteral(red: 0.7450980392, green: 0.9333333333, blue: 0.768627451, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8941176471, blue: 0.8509803922, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.8666666667, alpha: 1))]
    
    @State private var selectedPage = 1
    @State private var selectedColor = Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1))
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .top) {
                    selectedColor
                        .animation(.easeInOut)
//                        .frame(width: geometry.size.width, height: geometry.size.height / 3 * 2)
                
                    
                    TabView(selection: $selectedPage) {
                        Slide(text: "Relaxed", color: Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1)))
                            .tag(1)
                        
                        Slide(text: "Playful", color: Color(#colorLiteral(red: 0.7450980392, green: 0.9333333333, blue: 0.768627451, alpha: 1)), isTrailingText: true)
                            .tag(2)
                            
                        Slide(text: "Excentric", color: Color(#colorLiteral(red: 1, green: 0.8941176471, blue: 0.8509803922, alpha: 1)))
                            .tag(3)
                            
                        Slide(text: "Funky", color: Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.8666666667, alpha: 1)), isTrailingText: true)
                            .tag(4)
                    }
                    .onChange(of: selectedPage, perform: { value in
                        selectedColor = colors[value - 1]
                    })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 3 * 2)
                
                VStack {
                    Text("Your style, your way")
                    
                    Text("Create your individual & unique style and look amazing everyday")
                        .multilineTextAlignment(.center)
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

struct Slide: View {
    var text: String
    var color: Color
    var isTrailingText: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text(text)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .bold()
                    .rotationEffect(.degrees((isTrailingText ? -1 : 1) * 90))
                    .offset(x: ((isTrailingText ? 1 : -1) * geometry.size.width / 2) + ((isTrailingText ? -1 : 1) * 50))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
