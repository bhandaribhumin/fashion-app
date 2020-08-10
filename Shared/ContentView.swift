//
//  ContentView.swift
//  Shared
//
//  Created by Vitor Capretz on 2020-08-09.
//

import SwiftUI

struct SlideContent {
    let color: Color
    let title: String
    let subtitle: String
    let description: String
    let imageName: String
}

enum ButtonVariant {
    case primary, standard
}

let slides: [SlideContent] = [
    SlideContent(color: Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1)), title: "Relaxed", subtitle: "Find your outfits", description: "Confused about your outfit? Don't worry! Find the best outfit here!", imageName: "onboarding1"),
    SlideContent(color: Color(#colorLiteral(red: 0.7450980392, green: 0.9333333333, blue: 0.768627451, alpha: 1)), title: "Playful", subtitle: "Hear it first, wear it first", description: "Hating the clothes in your wardrobe? Explore hundreds of outfits ideas", imageName: "onboarding2"),
    SlideContent(color: Color(#colorLiteral(red: 1, green: 0.8941176471, blue: 0.8509803922, alpha: 1)), title: "Excentric", subtitle: "Your style, your way", description: "Create your individual & unique style and look amazing everyday", imageName: "onboarding3"),
    SlideContent(color: Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.8666666667, alpha: 1)), title: "Funky", subtitle: "Look good, feel good", description: "Discover the latest trends in fashion and explore your personality", imageName: "onboarding4"),
]

let slideCount: Int = slides.count - 1

struct ContentView: View {
    @State private var selectedPage = 0
    @State private var selectedColor = slides[0].color
    
    var body: some View {
        ZStack(alignment: .top) {
            selectedColor
                .clipShape(FunkyBorders())
                .animation(.easeInOut)
            
            TabView(selection: $selectedPage) {
                ForEach(0 ..< slides.count) { slideIndex in
                    Slide(slide: slides[slideIndex], isTrailingText: slideIndex % 2 != 0, isLast: slideIndex == slideCount, slideIndex: slideIndex, selectedPage: $selectedPage)
                        .tag(slideIndex)
                }
            }
            .ignoresSafeArea()
            .onChange(of: selectedPage, perform: { value in
                selectedColor = slides[value].color
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
