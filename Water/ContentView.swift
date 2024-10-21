import SwiftUI

struct Water: View {
    @State private var bodyWeight: String = ""
    @State private var calculatedWaterIntake: Double? = nil

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                
                Image("water_drop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.horizontal, 32)
                
                Text("Hydrate")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 32)
                
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 32)
                    .padding(.top, 8)
                
                // Body weight input
                HStack {
                    Text("Body weight (kg)")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    TextField("Value", text: $bodyWeight)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                    
                    if !bodyWeight.isEmpty {
                        Button(action: {
                            bodyWeight = ""
                            calculatedWaterIntake = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 32)
                .padding(.top, 24)
                
                Spacer()
                
                // Next button
                NavigationLink(destination: Notification(calculatedWaterIntake: $calculatedWaterIntake)) {
                    Text("Next")
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
            .navigationTitle("Body Weight")
        }
        .onAppear {
            calculateWaterIntake() // Calculate water intake when the view appears
        }
    }
    
    func calculateWaterIntake() {
        if let weight = Double(bodyWeight) {
            calculatedWaterIntake = weight * 0.03
        }
    }
}
struct water_Previews: PreviewProvider {
    static var previews: some View {
        Water()
    }
}

