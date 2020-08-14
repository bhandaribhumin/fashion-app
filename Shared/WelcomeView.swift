//
//  WelcomeView.swift
//  Fashion
//
//  Created by Vitor Capretz on 2020-08-14.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -50)
            }
            .padding(.horizontal, 44)
            .background(Color(#colorLiteral(red: 0.9568627451, green: 0.9411764706, blue: 0.937254902, alpha: 1)))
            .clipShape(FunkyBorders(lineHeightPercentage: 0.90))
            
            VStack(spacing: 24) {
                Spacer()
                 
                Text("Let's get started")
                    .fontWeight(.semibold)
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                
                Text("Login to your account below or signup for an amazing experience")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(#colorLiteral(red: 0.04705882353, green: 0.05098039216, blue: 0.2039215686, alpha: 1)))
                    .padding(.bottom, 50)
                
                NavigationLink(destination: Text("login screen")) {
                    Text("Have an account? Login")
                        .modifier(ButtonPrimary())
                }
                
                NavigationLink(destination: Text("sign up screen")) {
                    Text("Join us, it's free")
                        .modifier(ButtonSecondary())
                }
                
                NavigationLink(destination: Text("forgot password screen")) {
                    Text("Forgot password?")
                        .modifier(ButtonTertiary())
                }
            }
            .padding(.horizontal, 44)
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
