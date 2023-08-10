//
//  ContentView.swift
//  heartrate watch Watch App
//
//  Created by TXT-76 on 7/19/23.
//

import SwiftUI
import Combine
import HealthKit
import Foundation


struct WelcomePage: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("SleepGuardian")
                    .imageScale(.large)
                    .foregroundColor(.purple)

                Spacer()

                Text("Welcome To Sleep Guardian")
                    .font(.custom("SecularOne", size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Spacer()

                NavigationLink("BEGIN", destination: AllowAccess())
                    .foregroundColor(Color.white)
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)

                Spacer()
            }
        }
    }
}

struct  WelcomePage_Previews:PreviewProvider{
    static var previews: some View{
        WelcomePage()
    }
}

struct AllowAccess: View {
//    @State private var isAuthorized = false
//    private let healthKitManager = HealthKitManager()

    var body: some View {
        VStack {
            Image("SleepGuardian")
                .imageScale(.large)
                .foregroundColor(.purple)

            Spacer()

            Text("Allow SleepGuardian to access your heart rate information")
                .font(.custom("SecularOne", size: 13))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Spacer()

            HStack {
                NavigationLink("DON'T ALLOW", destination: WelcomePageReturn())
                    .font(.custom("SecularOne", size: 9))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)

                Spacer()

                NavigationLink("ALLOW", destination: BPMC())
                    .font(.custom("SecularOne", size: 11))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
                    .cornerRadius(25)
            }
        }
//        .onAppear {
//            healthKitManager.requestHeartRateAuthorization { success, _ in
//                isAuthorized = success
            }
        }
//    }
//}

// ... (Other views remain the same)

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
                        BPMC()
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

struct BPMC: View{
    var body: some View{
        VStack{
            Text("RESTING BPM")
            Spacer()
            HStack{
                Image("Heart")
                Text("80")
            }
        
            Text("Heart Rate")
            Spacer()
            NavigationLink("NEXT") {
                ContentView2()
            }
            .foregroundColor(Color.white )
            .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
            .cornerRadius(25)
            Spacer()
        }
        
            Spacer()
            NavigationLink("BEGIN") {
                ContentView3()
            }
            .foregroundColor(Color.white )
            .background(Color(red: 80 / 255, green: 1 / 255, blue: 142 / 255))
            .cornerRadius(25)
            Spacer()
        }
    }

struct BPMC_Previews: PreviewProvider {
            static var previews: some View {
                BPMC()
            }
        }

import WatchKit
import Foundation
import SwiftUI
import UIKit

struct ContentView2: View {
    var body: some View {
       
        
        
        Button(action: {
            // Call the method to trigger vibration
            vibrateWatch()
        }, label: {
            Text("Vibrate Watch")
        })
        
    }
    
    // Function to trigger vibration
    private func vibrateWatch() {
        if #available(watchOS 7.0, *) {
            WKInterfaceDevice.current().play(.notification)
        } else {
            // Fallback for older watchOS versions (optional)
            print("Vibration not supported on this watchOS version.")
        }
    }
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}


struct ContentView3: View {
    @State private var isVibrating = false // Track vibration state
    
    // Property to hold the reference to the vibration timer
    private var vibrationTimer: Timer?
    
    var body: some View {
        Button(action: {
            // Toggle vibration state and start/stop vibration loop
            isVibrating.toggle()
            if isVibrating {
                startVibrationLoop()
            } else {
                stopVibrationLoop()
            }
        }, label: {
            Text(isVibrating ? "Start Vibration" : "Stop Vibration")
        })
    }
    
    // Function to trigger vibration
    private func vibrateWatch() {
        if #available(watchOS 7.0, *) {
            WKInterfaceDevice.current().play(.notification)
        } else {
            // Fallback for older watchOS versions (optional)
            print("Vibration not supported on this watchOS version.")
        }
    }
    
    // Function to start the vibration loop
    private func startVibrationLoop() {
        // Start a loop to repeatedly vibrate
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            vibrateWatch()
        }
    }
    
    // Function to stop the vibration loop
    private func stopVibrationLoop() {
        // Stop the vibration loop (invalidate the timer)
        
       
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //struct HealthKitManager: View {
    //
    //    var body: some View {
    //
    //        class HealthKitManager {
    //            let healthStore = HKHealthStore()
    //
    //            func requestHeartRateAuthorization(completion: @escaping (Bool, Error?) -> Void) {
    //                let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    //
    //                return healthStore.requestAuthorization(toShare: [], read: [heartRateType]) { success, error in
    //                    completion(success, error)
    //                }
    //            }
    //
    //            func startHeartRateReading(completion: @escaping (Double) -> Void) {
    //                guard HKHealthStore.isHealthDataAvailable() else { return }
    //                let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
    //                let datePredicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictEndDate)
    //                let query = HKSampleQuery(sampleType: heartRateType, predicate: datePredicate, limit: 1, sortDescriptors: nil) { query, samples, error in
    //                    if let samples = samples as? [HKQuantitySample], let sample = samples.first {
    //                        let heartRateUnit = HKUnit(from: "count/min")
    //                        let heartRate = sample.quantity.doubleValue(for: heartRateUnit)
    //                        completion(heartRate)
    //                    } else {
    //                        completion(0.0)
    //                    }
    //                }
    //                healthStore.execute(query)
    //
    //            }
    //
    //        }
    //
    //    }
    //}
    //
    //struct HealthKitManager_Previews: PreviewProvider {
    //            static var previews: some View {
    //                return HealthKitManager()
    //            }
    //        }

