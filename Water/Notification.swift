//
//  SwiftUIView.swift
//  Water
//
//  Created by mona alruthaya on 17/04/1446 AH.
//

import SwiftUI

struct Notification: View {
    @Binding var calculatedWaterIntake: Double?  // Pass water intake to the next view
    @State private var startHour: Date = Date()
    @State private var endHour: Date = Date()
    @State private var selectedInterval: String = "15 Mins"
    
    let intervals = ["15 Mins", "30 Mins", "60 Mins", "90 Mins", "2 Hours", "3 Hours", "4 Hours", "5 Hours"]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Notification Preferences")
                .font(.title2)
                .padding(.horizontal, 32)
                .padding(.top, 20)
                .fontWeight(.bold)
            
            Text("Start and End Hours")
                .font(.headline)
                .padding(.top, 20)
                .padding(.horizontal, 32)

            VStack() {
                TimePickerRow(label: "Start hour", selectedTime: $startHour)
                TimePickerRow(label: "End hour", selectedTime: $endHour)
            }
            .padding(.horizontal, 32)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Notification Interval")
                    .font(.headline)
                    .padding(.horizontal, 32)
                    .padding(.top, 20)

                Text("How often would you like to receive notifications within the specified time interval")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 32)
                    .frame(height: nil)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 10) {
                    ForEach(intervals, id: \.self) { interval in
                        Button(action: {
                            selectedInterval = interval
                        }) {
                            Text(interval)
                                .font(.system(size: 15))
                                .foregroundColor(selectedInterval == interval ? Color.white : Color.black)
                                .padding()
                                .background(selectedInterval == interval ? Color(.cyan) : Color(UIColor.systemGray6))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 20)
            }
            
            Spacer()
            
            // Start button to move to WaterIntakeView
            NavigationLink(destination: WaterIntakeView(waterIntake: $calculatedWaterIntake)) {
                Text("Start")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.cyan))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 40)
        }
    }
}

struct TimePickerRow: View {
    var label: String
    @Binding var selectedTime: Date
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .frame(maxWidth: 100)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}


