//
//  SwiftUIView.swift
//  Water
//
//  Created by mona alruthaya on 17/04/1446 AH.
//

import SwiftUI

struct Notification: View {
    @State private var startHour: Date = Date()
    @State private var endHour: Date = Date()
    @State private var selectedInterval: String = "15 Mins"
    
    let intervals = ["15 Mins", "30 Mins", "60 Mins", "90 Mins", "2 Hours", "3 Hours", "4 Hours", "5 Hours"]
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            Spacer()
            // Title
            Text("Notification Preferences")
                .font(.system(size: 22))
                .padding(.horizontal, 32)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            
            Text("The start and End hour")
                .font(.headline)
                .padding(.top, 20)
                .padding(.horizontal, 32)
            

            
            Text("Specify the start and end date to receive the notifications")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 32)
            
            // Start and End time pickers
            VStack() {
                TimePickerRow(label: "Start hour", selectedTime: $startHour)
                TimePickerRow(label: "End hour", selectedTime: $endHour)
            }
            
            .padding(.horizontal, 32)

            // Notification Interval
            VStack(alignment: .leading,spacing: 10) {
                Text("Notification interval")
                    .font(.headline)
                    .padding(.horizontal, 32)
                    .padding(.top, 20)
                
                
                //how to make all text shows
                Text("How often would you like to receive notifications within the specified time interval")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal, 32)
                    .frame(height: nil)
                    
                
                // Interval selection buttons
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 10) {
                    ForEach(intervals, id: \.self) { interval in
                        Button(action: {
                            selectedInterval = interval
                        }) {
                            Text(interval)
                                .font(.system(size: 15))
                                .font(.headline)
                                .foregroundColor(selectedInterval == interval ? Color.white : Color.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedInterval == interval ? Color(hex: "#32ADE6") : Color(UIColor.systemGray6))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing], 32)
                .frame(width: nil)
            }

          
            // Start button
            Button(action: {
                // Action for Start button
                print("Start button pressed")
            }) {
                Text("Start")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .frame(height: nil)
                    .background(Color(hex: "#32ADE6")) // Custom color for the button
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 40)
        }
      //  .navigationTitle("Onboarding Screen 02 (Notification Preferences)")
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


struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
