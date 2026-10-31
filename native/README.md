# こえアンプ（ネイティブ版 / SwiftUI）

Bluetoothスピーカーで確実に鳴らしたいときの版です。
Safari（Webアプリ版）はマイクを使うとBluetoothの高音質出力（A2DP）を使えないため、スタートした瞬間にスピーカーとの接続が切れたり、iPad本体から音が出たりします。
この版はiOSに「出力はBluetooth(A2DP)、入力はiPad本体マイク」と直接指定するので、この問題が起きません。

## 方法1：iPadだけで作る（Swift Playgrounds）※Mac不要
1. App Storeで **Swift Playgrounds**（Apple製・無料）を入れる
2. 起動 →「アプリ」（App）を新規作成 → 名前を「こえアンプ」にする
3. 左のファイル一覧で
   - `MyApp.swift` の中身を全部消し、`VoiceAmpApp.swift` の中身を貼り付け
   - `ContentView.swift` の中身を全部消し、`ContentView.swift` の中身を貼り付け
   - 「＋」→ 新規ファイル → 名前 `AudioAmplifier` を作り、`AudioAmplifier.swift` の中身を貼り付け
4. 左上のアプリ設定（歯車アイコン）→ **機能（Capabilities）→ ＋ → マイク（Microphone）** を追加し、説明に「声を拡声するためにマイクを使います」と入力
5. Bluetoothスピーカーを接続してから、右上の ▶︎（実行）を押す → 「スタート」→ マイクを許可
6. 実行できたら、アプリ設定の **「Appをインストール」** でホーム画面に追加できます（以降はPlaygroundsを開かずに使えます）

## 方法2：Mac + Xcode
1. Xcode → File → New → Project → iOS「App」（Interface: SwiftUI、名前: VoiceAmp）
2. 自動生成された `VoiceAmpApp.swift` / `ContentView.swift` を、このフォルダの3つの .swift ファイルで置き換え（`AudioAmplifier.swift` も追加）
3. ターゲット → Info に `Privacy - Microphone Usage Description` を追加
4. iPadをMacにつないで実行

## 画面の見かた
- 「出力先: 〇〇」が緑ならBluetoothスピーカーから出ています。
- オレンジの注意が出たら、コントロールセンターのAirPlayマークからスピーカーを選んでください。

## 処理の内容
低音カット(180Hz) → 音量 → ピークリミッター の順で処理し、ハウリングと音割れを抑えます。
スピーカーの接続・切断で出力先が変わっても自動で再開します。
