//
//  ContentView.swift
//  heartrate watch Watch App
//
//  Created by TXT-76 on 7/19/23.
//

import SwiftUI
import Combine
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
                    .fontWeight(.bold)
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
        VStack {
            NavigationStack{
                VStack{
                    Text("What's Your Age?")
                        .fontWeight(.bold)
                    Spacer()
                    TextField("Enter Age", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    Spacer()
                    NavigationLink("NEXT") {
                        Height()
                    }
                    .foregroundColor(Color.white )
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
                }
            }
                    }
    }
}

struct Age_Previews: PreviewProvider {
    static var previews: some View {
        Age()
    }
}

struct Height: View {
var body: some View{
    VStack {
        NavigationStack{
            VStack{
                Text("What's Your Height?")
                    .fontWeight(.bold)
                Spacer()
                TextField("Enter Height", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Spacer()
                NavigationLink("NEXT") {
                    Weight()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
            }
        }
                }
}
}

struct Height_Previews: PreviewProvider {
static var previews: some View {
 Height()
}
}

struct Weight: View {
var body: some View{
    VStack {
        NavigationStack{
            VStack{
                Text("What's Your Weight?")
                    .fontWeight(.bold)
                Spacer()
                TextField("Enter Weight", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Spacer()
                NavigationLink("NEXT") {
                    FitnessLevel()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
            }
        }
                }
}
}

struct Weight_Previews: PreviewProvider {
static var previews: some View {
Weight()
}
}

struct FitnessLevel: View {
var body: some View{
    VStack {
        NavigationStack{
            VStack{
                Spacer()
                Text("What Is Your Level Of Fitness?")
                  
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                Spacer()
                NavigationLink("Not Very Active") {
                   OK()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
                Spacer()
                NavigationLink("Slightly Active") {
                    OK()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
                Spacer()
                NavigationLink("Very Active") {
                    OK()
                }
                .foregroundColor(Color.white )
                .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                .cornerRadius(25)
                Spacer()
            }
        }
        }
}
}

struct FitnessLevel_Previews: PreviewProvider {
static var previews: some View {
FitnessLevel()
}
}

struct OK: View{
    var body: some View{
        NavigationStack{
            VStack{
                Text("OK ")
                NavigationLink("Chicken tendies"){
                    StackOverflowTests()
                }
            }
        }
    }
    
    struct OK_Previews: PreviewProvider {
        static var previews: some View {
            OK()
        }
    }
    
}

                

struct StackOverflowTests: View {
    @State var numOfPeopl = "Enter Age"
    
    var body: some View {
        TextField("Enter Age", text: $numOfPeopl)
            .onReceive(Just(numOfPeopl)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.numOfPeopl = filtered
                    
                    struct StackOverflowTests_Previews: PreviewProvider{
                        typealias Previews = <#type#>
                        
                        @State var numOfPeopl: <# Type #>{
                            StackOverflowTests()
                        }
                    }
                }
            }
    }
}
