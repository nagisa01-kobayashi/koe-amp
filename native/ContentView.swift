import SwiftUI

struct ContentView: View {
    @StateObject private var amp = AudioAmplifier()
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 28) {
            Text("🎤 こえアンプ").font(.largeTitle).bold()

            Button {
                if amp.isRunning { amp.stop() }
                else {
                    do { try amp.start(); errorMessage = nil }
                    catch { errorMessage = "開始できません: \(error.localizedDescription)" }
                }
            } label: {
                Text(amp.isRunning ? "ストップ" : "スタート")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 220)
                    .background(Circle().fill(amp.isRunning ? Color.green : Color.blue))
            }

            if !amp.routeName.isEmpty {
                Text("出力先: \(amp.routeName)")
                    .foregroundColor(amp.isBluetoothOut ? .green : .secondary)
            }
            if amp.isRunning && !amp.isBluetoothOut {
                Text("Bluetoothスピーカーに出ていません。コントロールセンターのAirPlayマークからスピーカーを選んでください。")
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
            }
            if let errorMessage { Text(errorMessage).foregroundColor(.orange) }

            VStack(alignment: .leading) {
                HStack { Text("音量"); Spacer(); Text(String(format: "×%.1f", amp.gain)).monospacedDigit() }
                Slider(value: $amp.gain, in: 0...8)
                Text("入力レベル")
                ProgressView(value: amp.level).tint(.green)
            }
            .font(.title3)
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.secondarySystemBackground)))
        }
        .padding()
        .frame(maxWidth: 560)
        .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
    }
}
