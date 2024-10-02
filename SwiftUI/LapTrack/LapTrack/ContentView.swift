//
//  ContentView.swift
//  LapTrack
//
//  Created by Ravi Shankar on 18/09/24.
//

import SwiftUI

//struct LapTime: Identifiable, Hashable {
//    var id = UUID()
//    var timeString: String
//}

struct ContentView: View {
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var isRunning = false
    @State private var lapTimes: [TimeInterval] = []
  //  @State private var laps: [LapTime] = []
    
    var body: some View {
        VStack {
            Text("LapTrack")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(timeString(from: elapsedTime))
                .font(.system(size: 60, weight: .thin, design: .monospaced))
                .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    if isRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Text(isRunning ? "Stop" : "Start")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(isRunning ? Color.red : Color.green)
                        .cornerRadius(10)
                }
                
                Button(action: recordLapTime) {
                    Text("Lap")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(!isRunning)
                
                Button(action: resetTimer) {
                    Text("Reset")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
            .padding()
            
//            List(Array(laps.enumerated().reversed()), id: \.element.id) { index, lap in
//                HStack {
//                    Text("Lap \(laps.count - index)")
//                        .font(.headline)
//                    Spacer()
//                    Text(lap.timeString)
//                        .font(.system(.body, design: .monospaced))
//                }
//            }
//            
//            List(Array(lapTimes.enumerated()), id: \.offset) { index, lapTime in
//                HStack {
//                    Text("Lap \(lapTimes.count - index)")
//                        .font(.headline)
//                    Spacer()
//                    Text(timeString(from: lapTimes[index]))
//                        .font(.system(.body, design: .monospaced))
//                }
//            }
            
            List {
                ForEach(lapTimes.indices, id: \.self) { index in
                    HStack {
                        Text("Lap \(lapTimes.count - index)")
                            .font(.headline)
                        Spacer()
                        Text(timeString(from: lapTimes[index]))
                            .font(.system(.body, design: .monospaced))
                    }
                }
                .onDelete(perform:deleteLap)
            }
        }
    }
    
    private func deleteLap(offsets: IndexSet) {
        lapTimes.remove(atOffsets: offsets)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            elapsedTime += 0.01
        }
        isRunning = true
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func resetTimer() {
        stopTimer()
        elapsedTime = 0
        lapTimes.removeAll()
    }
    
    func recordLapTime() {
        lapTimes.insert(elapsedTime, at: 0)
     //   laps.append(LapTime(timeString: timeString(from: elapsedTime)))
        
    }
    
    func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        let hundredths = Int((timeInterval.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02d:%02d.%02d", minutes, seconds, hundredths)
    }
}
//#Preview {
//    ContentView()
//}
