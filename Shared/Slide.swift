//
//  Slide.swift
//  Fashion
//
//  Created by Vitor Capretz on 2020-08-09.
//

import SwiftUI

struct Slide: View {
    var slide: SlideContent
    var isTrailingText: Bool = false
    var isLast: Bool
    var slideIndex: Int
    @Binding var selectedPage: Int
    
    var variant: ButtonVariant {
        if isLast {
            return .primary
        }
        
        return .standard
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Text(slide.title)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .bold()
                    .rotationEffect(.degrees((isTrailingText ? -1 : 1) * 90))
                    .offset(y: geometry.size.height / 6)
                    .offset(x: ((isTrailingText ? 1 : -1) * geometry.size.width / 2) + ((isTrailingText ? -1 : 1) * 50))
                
                VStack(spacing: 12) {
                    Spacer()
                    
                    Text(slide.subtitle)
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                    
                    
                    Text(slide.description)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                        .padding(.bottom, 40)
                    
                    Button(action: navigate) {
                        Text(variant == .primary ? "Let's get started" : "Next")
                            .foregroundColor(variant == .primary ? .white : Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                            .frame(width: 245, height: 50)
                            .background(Color(variant == .primary ? #colorLiteral(red: 0.1725490196, green: 0.7254901961, blue: 0.6901960784, alpha: 1) : #colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 0.05121630933)))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 44)
                
            }
        }
    }
    
    func navigate() {
        if !isLast {
            selectedPage = slideIndex + 1
        }
    }
}

struct FunkyBorders: Shape {
    let curveSize = 50
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let lineHeight = Int(rect.height * 0.66)
        
        path.move(to: CGPoint(x: 0, y: lineHeight + curveSize))
        
        path.addQuadCurve(
            to: .init(
                x: curveSize,
                y: lineHeight
            ),
            control: .init(
                x: 0,
                y: lineHeight
            )
        )

        path.addLine(
            to: .init(
                x: Int(rect.width) - curveSize,
                y: lineHeight
            )
        )

        path.addQuadCurve(
            to: .init(
                x: rect.width,
                y: CGFloat(lineHeight - curveSize)
            ),
            control: .init(
                x: Int(rect.width),
                y: lineHeight
            )
        )
        
        path.addLine(
            to: .init(
                x: Int(rect.width),
                y: Int(rect.minY)
            )
        )

        path.addLine(
            to: .init(
                x: Int(rect.minX),
                y: Int(rect.minY)
            )
        )

        return path
    }
}

struct Slide_Previews: PreviewProvider {
    static let slideTest: SlideContent = SlideContent(color: .pink, title: "Test", subtitle: "Some more title", description: "A longer description here would fit super nicely on the screen", image: OnboardingImage(name: "onboarding4", width: 1757, height: 2551))
    
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.7905165553, green: 0.932869494, blue: 0.969142735, alpha: 1))
                .clipShape(FunkyBorders())
            
            Slide(slide: slideTest, isTrailingText: false, isLast: true, slideIndex: 0, selectedPage: .constant(1))
        }
    }
}
