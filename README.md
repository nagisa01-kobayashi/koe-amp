# こえアンプ 🎤

iPadのマイクに入った声を、リアルタイムでBluetoothスピーカーから大きく出すWebアプリです。

**アプリを開く → https://nagisa01-kobayashi.github.io/koe-amp/**

## 使い方
1. iPadの設定 → Bluetooth でスピーカーを接続
2. 上のURLをSafariで開く（共有ボタン →「ホーム画面に追加」でアプリのように使えます）
3. 「スタート」→ マイクを「許可」→ 音量スライダーで調整

## Bluetoothスピーカーから音が出ない／スタートで接続が切れるとき
Safariはマイクを使っている間、Bluetoothの高音質出力（A2DP）を使えません。そのためWebアプリ版では、スピーカーとの接続が切れたり、iPad本体から音が出たりします。
- **ケーブル接続**（USB-C/Lightning→3.5mm変換でスピーカーのAUX端子へ）なら確実です
- **アプリ版**（[`native/`](native/)）なら、Bluetoothのまま使えます。Swift Playgroundsを使うのでMacは不要です

## 注意
- Bluetoothの仕組み上、声が0.1〜0.3秒ほど遅れて出ます。
- ハウリング（キーン音）は、スピーカーをiPadから離し、マイクに向けないことで防げます。
- 音声はiPadの中だけで処理され、外部には送信されません。
