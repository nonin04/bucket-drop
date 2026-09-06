# GEMINI.md - Guidelines & Architecture

## 1. プロジェクト概要 (Project Overview)
- **Framework**: Flutter (Dart) / iOS, Android
- **Architecture**: Feature-first (MVVM)
- **Routing**: `go_router`
- **State Management**: `flutter_riverpod` (`riverpod_generator`)
- **Local Database**: SQLite (`STRICT` モード) / `drift`

## 2. ディレクトリ構成 (Directory Structure)
```text
lib/
├── main.dart                             # エントリポイント
├── app/                                  # アプリ基盤
│   ├── app.dart                          # MaterialApp設定
│   ├── router.dart                       # ルーティング (go_router)
│   └── theme.dart                        # テーマ設定
├── core/                                 # 共通基盤
│   ├── database/                         # app_database.dart, seed.dart, tables/*.drift
│   ├── enums/                            # 横断Enum
│   ├── utils/                            # ヘルパー・定数
│   └── widgets/                          # 共通UIパーツ
└── features/[feature_name]/              # 機能別 (例: drop, bucket)
    ├── domain/                           # 業務モデル ([feature].dart)
    ├── data/                             # [feature]_repository.dart (Drift操作・変換)
    └── presentation/                     # [feature]_page.dart, [feature]_controller.dart, widgets/
```

## 3. コーディング規約 & 設計原則 (Coding Standards & Principles)
- **Immutability**: Stateクラスやドメインモデルには `freezed` を採用して不変にする。
- **命名規則**: `domain/` 内のモデルに `_entity` 等の冗長な接尾辞は付けない。
- **Feature分割**: 従属データ（例: dropに対するdrop_category）は親Feature内に同居。独立画面や汎用参照がある場合のみ単独Featureとして切り出す。
- **UIとロジック**: 
  - `build()` 内にロジックやDB操作を書かず、Controller/Notifier 経由で `AsyncValue` を監視・描画する。
  - Widgetは150行を目安に責務ごとに分割する。
- **ルーティング**: 画面遷移は `go_router`（`context.go` / `context.push`）に統一し、命令的 `Navigator` の直接操作は禁止。設定は `lib/app/router.dart` に集約する。
- **状態管理**: Provider/Notifierは `@riverpod` によるコード自動生成を必須とし、レガシーな手動定義は禁止する。
- **依存管理**: 安易に `pubspec.yaml` の依存関係を増やさず、標準機能や既存パッケージでの実装を優先する。

## 4. データベース方針 (Database Guidelines)
- **生SQLの記述**: 原則として `.drift` ファイルに生SQLを記述し、コード生成で型安全に呼び出す（メソッドチェーンORMは禁止、Goの `sqlc` スタイル）。
- **動的クエリの例外**: 検索条件が可変の一覧画面等に限り、Repository内で `customSelect` の利用を許可する。
- **固定クエリの徹底**: 状態による詳細取得等の分岐は、文字列結合ではなく用途別の固定SQLに分ける。

## 5. Git運用 (Git Workflow)
- **指示時の一括自動化**: 「コミットして」等の指示があった場合は、変更内容を論理的な単位（適切な粒度）に分割してステージング・コミットを作成し、リモートブランチへ `git push` まで自動で完結させること。

## 6. 学習方針
- 本プロジェクトは **Flutter の学習・習得を兼ねた個人開発プロジェクト** です。
- 開発者は Flutter 未経験のため、コード提示だけでなく **「なぜその書き方をするのか」「裏でどのような仕組みが動いているのか」** を必要に応じて噛み砕いてわかりやすく解説してください。
- Flutterの宣言的な書き方を学びたいため、都度チェックを行なってください。
