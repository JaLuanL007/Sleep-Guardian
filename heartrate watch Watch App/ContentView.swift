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
                        OK()
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
                        WelcomePageReturn()
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
                        OK()
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

struct WelcomePageReturn: View {
    
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

struct WelcomePageReturn_Previews: PreviewProvider {
            static var previews: some View {
                WelcomePageReturn()
            }
        }
struct OK: View{
    var body: some View {
        Text("76")
    }
    }

struct OK_Previews: PreviewProvider {
            static var previews: some View {
                OK()
            }
        }


struct HeartrateSensor: View{
    @State  var heartRate: Double = 0.0
    @State  var isAuthorized = false
    var body: some View {
        VStack {
            Text("Heart Rate: \(Int(heartRate))")
                .padding()
            Button(action: {
                authorizeHealthKit()
            }) {
                Text("Request Authorization")
            }
            .padding()
            .disabled(isAuthorized)
        }
    }
    func authorizeHealthKit() {
        let healthStore = HKHealthStore()
        let readTypes: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .heartRate)!]
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { (success, error) in
            if success {
                isAuthorized = true
                startHeartRateReading()
            } else {
                // Handle error
            }
        }
    }
    func startHeartRateReading() {
        guard HKHealthStore.isHealthDataAvailable() else { return }
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let query = HKObserverQuery(sampleType: heartRateType, predicate: nil) { (query, completionHandler, error) in
            if error != nil {
                // Handle error
                return
            }
            self.readHeartRate()
        }
        let healthStore = HKHealthStore()
        healthStore.execute(query)
    }
    func readHeartRate() {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let datePredicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictEndDate)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: datePredicate, limit: 1, sortDescriptors: nil) { (query, samples, error) in
            if let samples = samples as? [HKQuantitySample] {
                if let sample = samples.first {
            //        let heartRateUnit = HKUnit(from: count/min )
               //     self.heartRate = sample.quantity.doubleValue(for: heartRateUnit)
                }
            }
        }
        let healthStore = HKHealthStore()
        healthStore.execute(query)
    }
}

struct HeartrateSensor_Previews: PreviewProvider {
    static var previews: some View{
        HeartrateSensor()
    }
}

