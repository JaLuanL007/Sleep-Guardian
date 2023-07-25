//
//  ContentView.swift
//  heartrate watch Watch App
//
//  Created by TXT-76 on 7/19/23.
//

import SwiftUI

struct WelcomePage: View {
    
        var body: some View {
            NavigationStack {

            HStack {
                Image("SleepGuardian")
                    .imageScale(.large)
                    .foregroundColor(.purple)
                Text("Welcome")
                    .font(.custom(
                        "SecularOne",
                        fixedSize: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            Spacer();
            Text("Sleep Guardian is your smart sleep assistant aimed towards combating Sleep Paralysis")
                .font(.custom(
                    "SecularOne", fixedSize:10
                ))
              //                      .fontWeight(.heavy)
            //                        .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
            Spacer()
                    VStack {
                        NavigationLink("BEGIN") {
                            InfoPage()
                                                }
                                .foregroundColor(Color.white )
                                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                                .cornerRadius(25)
                        
                                        
                    }
                }
                
            }
        }

struct WelcomePage_Previews: PreviewProvider {
            static var previews: some View {
                WelcomePage()
            }
        }

struct InfoPage: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("To get started, we’d like to ask you questions. Your answers will help us combat your sleep paralysis")
                    .font(.custom(
                        "SecularOne", fixedSize:12
                    ))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                Spacer()
                NavigationLink("NEXT") {
                    Age()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
            }
            }
        }
    }

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
        
struct Age: View {
    var body: some View{
        NavigationStack{
            VStack{
                Text("What's Your Age?")
                    .fontWeight(.bold)
                Spacer()
                
            }
        }
    }
}

struct Age_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}

struct Height: View {
var body: some View{
NavigationStack{
    VStack{
        Text("What's Your Age?")
            .fontWeight(.bold)
        Spacer()
        
    }
}
}
}

struct Height_Previews: PreviewProvider {
static var previews: some View {
 Age()
}
}

struct Weight: View {
var body: some View{
NavigationStack{
    VStack{
        Text("What's Your Age?")
            .fontWeight(.bold)
        Spacer()
        
    }
}
}
}

struct Weight_Previews: PreviewProvider {
static var previews: some View {
Height()
}
}

    
        





