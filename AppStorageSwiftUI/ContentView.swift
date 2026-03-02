import SwiftUI

struct ContentView: View {
    // "username"というkeyで保存。初期値は"Guest"
    @AppStorage("username") private var username: String = "Guest"

    // Push通知設定をAppStorageで管理。初期値はfalse(OFF)
    @AppStorage("isPushNotificationEnabled") private var isPushNotificationEnabled: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                // ユーザー名セクション
                Section("ユーザー情報") {
                    Text("こんにちは、\(username)さん")
                    TextField("名前を入力", text: $username)
                }

                // Push通知設定セクション
                Section("Push通知設定") {
                    Toggle("Push通知", isOn: $isPushNotificationEnabled)
                }

                // 現在の設定値を確認するセクション
                Section("保存されている値") {
                    LabeledContent("username", value: username)
                    LabeledContent("Push通知", value: isPushNotificationEnabled ? "ON" : "OFF")
                }
            }
            .navigationTitle("設定")
        }
    }
}

#Preview {
    ContentView()
}
