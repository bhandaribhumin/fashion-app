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
}

enum ButtonVariant {
    case primary
    case standard
}

let slides: [SlideContent] = [
    SlideContent(color: Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1)), title: "Relaxed", subtitle: "Find your outfits", description: "Confused about your outfit? Don't worry! Find the best outfit here!"),
    SlideContent(color: Color(#colorLiteral(red: 0.7450980392, green: 0.9333333333, blue: 0.768627451, alpha: 1)), title: "Playful", subtitle: "Hear it first, wear it first", description: "Hating the clothes in your wardrobe? Explore hundreds of outfits ideas"),
    SlideContent(color: Color(#colorLiteral(red: 1, green: 0.8941176471, blue: 0.8509803922, alpha: 1)), title: "Excentric", subtitle: "Your style, your way", description: "Create your individual & unique style and look amazing everyday"),
    SlideContent(color: Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.8666666667, alpha: 1)), title: "Funky", subtitle: "Look good, feel good", description: "Discover the latest trends in fashion and explore your personality"),
]

struct ContentView: View {
    @State private var selectedPage = 0
    @State private var selectedColor = slides[0].color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    selectedColor
                        .frame(width: geometry.size.width, height: geometry.size.height / 4 * 3)
                        .animation(.easeInOut)
                
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 50))
                        
                        path.addQuadCurve(
                            to: .init(
                                x: 50,
                                y: 0
                            ),
                            control: .init(
                                x: 0,
                                y: 0
                            )
                        )
                        
                        path.addLine(
                            to: .init(
                                x: geometry.size.width - 50,
                                y: 0
                            )
                        )
                        
                        path.addQuadCurve(
                            to: .init(
                                x: geometry.size.width,
                                y: -50
                            ),
                            control: .init(
                                x: geometry.size.width,
                                y: 0
                            )
                        )
                        
                        path.addLine(
                            to: .init(
                                x: geometry.size.width,
                                y: 50
                            )
                        )
                        
                        path.addLine(
                            to: .init(
                                x: 0,
                                y: 50
                            )
                        )
                    }
                    .offset(y: -50)
                    .fill(Color.white)
                }
                
                TabView(selection: $selectedPage) {
                    ForEach(0 ..< slides.count) { slideIndex in
                        Slide(title: slides[slideIndex].title, subtitle: slides[selectedPage].subtitle, description: slides[selectedPage].description, color: slides[slideIndex].color, isTrailingText: slideIndex % 2 != 0, variant: slideIndex == slides.count - 1 ? ButtonVariant.primary : ButtonVariant.standard)
                            .tag(slideIndex)
                    }
                }
                .onChange(of: selectedPage, perform: { value in
                    selectedColor = slides[value].color
                })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Slide: View {
    var title: String
    var subtitle: String
    var description: String
    var color: Color
    var isTrailingText: Bool = false
    var variant: ButtonVariant
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Text(title)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .bold()
                    .rotationEffect(.degrees((isTrailingText ? -1 : 1) * 90))
                    .offset(y: geometry.size.height / 6)
                    .offset(x: ((isTrailingText ? 1 : -1) * geometry.size.width / 2) + ((isTrailingText ? -1 : 1) * 50))
            
                VStack(spacing: 12) {
                    Spacer()
                    
                    Text(subtitle)
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                    
                    
                    Text(description)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                        .padding(.bottom, 40)
                    
                    Button(action: {
                        
                    }) {
                        Text("Next")
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 15)
                    .background(variant == .primary ? Color.black : Color.grey)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                .padding(.horizontal, 44)
                .frame(height: geometry.size.height)
                .offset(y: -geometry.size.height / 8)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}
