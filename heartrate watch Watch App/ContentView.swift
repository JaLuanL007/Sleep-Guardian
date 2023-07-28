//
//  ContentView.swift
//  heartrate watch Watch App
//
//  Created by TXT-76 on 7/19/23.
//

import SwiftUI
import Combine
import HealthKit

struct WelcomePage: View {
    
        var body: some View {
            VStack {
                NavigationStack {
                
                VStack {
                    Image("SleepGuardian")
                        .imageScale(.large)
                        .foregroundColor(.purple)
                 
                    Spacer()
                    Text("Welcome To Sleep Guardian")
                        .font(.custom(
                            "SecularOne",
                            fixedSize: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                    
                
                        VStack {
                            Spacer()
                            NavigationLink("BEGIN") {
                                AllowAccess()
                                                    }
                                    .foregroundColor(Color.white )
                                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                                    .cornerRadius(25)
                Spacer()
                            
                                            
                        }
                }
                Spacer()
            }
                
            }
        }

struct WelcomePage_Previews: PreviewProvider {
            static var previews: some View {
                WelcomePage()
            }
        }

struct AllowAccess: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("SleepGuardian")
                    .imageScale(.large)
                    .foregroundColor(.purple)
                Spacer()
                Text("Allow SleepGuardian to access your heart rate information")
                    .font(.custom(
                        "SecularOne",
                        fixedSize: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    NavigationLink("DON'T ALLOW") {
                        AllowAccess2()
                    }
                    .font(.custom(
                        "SecularOne",
                        fixedSize: 9))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white )
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
                    Spacer()
                    NavigationLink("ALLOW") {
                        HeartrateSensor()
                    }
                    .font(.custom(
                        "SecularOne",
                        fixedSize: 11))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white )
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
                }
            }
        }
    }
}

struct AllowAccess_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccess()
    }
}

struct AllowAccess2: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("SleepGuardian")
                    .imageScale(.large)
                    .foregroundColor(.purple)
                Spacer()
                Text("SleepGuardian requires access to your heart rate information in order to combat sleep paralysis")
                    .font(.custom(
                        "Baloo Tammudu",
                        fixedSize: 11))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack{
                    NavigationLink("DON'T ALLOW") {
                        WelcomePage()
                    }
                    .font(.custom(
                        "Baloo Tammudu",
                        fixedSize: 9))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white )
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
                    NavigationLink("OK") {
                        HeartrateSensor()
                    }
                    .foregroundColor(Color.white )
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
                }
            }
        }
    }
}

struct AllowAccess2_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccess2()
    }
}

struct HeartrateSensor: View {
    @State var heartRate: Double = 0
    
    var body: some View {
        VStack {
            Text("Heart Rate: \(heartRate)")
                .font(.title)
            
            Button(action: {
                self.getHeartRate()
            }) {
                Text("Get Heart Rate")
                    .font(.headline)
            }
        }
    }
    
    func getHeartRate() {
        let healthStore = HKHealthStore()
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let date = Date()
        let predicate = HKQuery.predicateForSamples(withStart: date.addingTimeInterval(-60), end: date, options: .strictEndDate)
        let query = HKStatisticsQuery(quantityType: heartRateType, quantitySamplePredicate: predicate, options: .discreteAverage) { _, result, _ in
            guard let result = result, let quantity = result.averageQuantity() else {
                return
            }
            self.heartRate = quantity.doubleValue(for: HKUnit(from: "count/min"))
        }
        healthStore.execute(query)
    }
}


struct HeartrateSensor_Previews: PreviewProvider {
    static var previews: some View {
        HeartrateSensor()
    }
}
