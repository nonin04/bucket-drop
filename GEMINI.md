# GEMINI.md - Flutter Project Guidelines & Architecture

本ドキュメントは、本プロジェクトにおいてGemini / Antigravity IDE等のAIエージェントおよび開発者が一貫した品質・設計指針で実装・保守を行うためのガイドラインです。

---

## 1. プロジェクト概要 (Project Overview)
- **Framework**: Flutter (Dart)
- **Target Platforms**: iOS, Android
- **Architecture**: Feature-first (MVVM)
- **State Management**: flutter_riverpod (riverpod_generator によるコード生成を標準とする)
- **Local Database**: drift (SQLite) ※現状は外部API通信なし

---

## 2. ディレクトリ構成 (Directory Structure)
機能単位（Feature-first）での構成を基本とします。

```text
lib/
├── main.dart                             # アプリのエントリポイント
├── app/                                  # アプリ基盤
│   ├── app.dart                          # MaterialAppのラッパーなど
│   ├── router.dart                       # go_router等
│   └── theme.dart                        # アプリ全体のテーマ設定
├── core/                                 # アプリ共通基盤
│   ├── database/                         # DriftのDB本体・テーブル定義・Provider
│   │   ├── app_database.dart
│   │   └── app_database.g.dart
│   ├── enums/                            # アプリ全体で共有する横断的Enum
│   ├── utils/                            # 共通ヘルパー・フォーマッター・定数
│   └── widgets/                          # 共通UIパーツ
└── features/                             # 機能別
    └── [feature_name]/                   # 例: task, memo
        ├── domain/                       # 純粋な業務モデル（UI・DB非依存 / ※_entity等の接尾辞は不要）
        │   └── [feature].dart
        ├── data/                         # データアクセス・変換層
        │   ├── models/                   # 画面入力・境界モデル
        │   │   ├── [feature]_req.dart
        │   │   └── [feature]_res.dart
        │   └── [feature]_repository.dart # Drift DAO操作 & データ変換
        └── presentation/                 # UIと状態管理
            ├── [feature]_page.dart
            ├── [feature]_controller.dart (Riverpod Notifier)
            └── widgets/                  # 画面固有の部品
```

---

## 3. コーディング規約 & 設計原則 (Coding Standards & Principles)

### 3.1 一般原則・命名規則
- **Effective Dart**: 公式の Effective Dart ガイドラインに厳格に準拠する。
- **Lint ルール**: `flutter_lints` を適用し、静的解析の警告（Warning/Info）を放置しない。
- **Immutability**: 原則としてStateクラスやドメインモデルには `freezed` を採用して不変にする。
- **Riverpod Generator**: Provider/Notifierの実装には手動定義（`StateNotifierProvider` 等のレガシー記法）を避け、`@riverpod` アノテーションによるコード自動生成を使用すること。
- **命名規則**:
  - `domain/` 内のモデルには `_entity` 接尾辞を付けない（例: `task.dart`）。
  - `data/models/` 内のモデルには `_dto` 接尾辞を付けず、用途に応じて `_req`, `_res` 等を使用する（例: `task_req.dart`）。

### 3.2 Feature分割と主従関係の同居ルール
- **従属データの同居**: 親機能に従属するデータや小規模な関連概念（例: `drop` に対する `drop_category`）は、安易にFeatureを独立させず、主機能（`features/drop/`）の中に同居させる。
- **独立の基準**: その概念に「独立した管理画面や操作フロー」が存在するか、複数Featureから広く参照される場合にのみ、単独のFeatureとして切り出す。

### 3.3 Flutter / Widget 実装
- **const の徹底**: パフォーマンス向上のため、可能な限りウィジェットの生成に `const` を付与する。
- **肥大化の防止**: 1つのウィジェットが長大化（目安: 150行以上）した場合は、適切にプライベートウィジェットや責務ごとのコンポーネントに切り出す。
- **UIとロジックの分離**: `build()` メソッド内にビジネスロジックやDBクエリを直接書かない。状態管理層（Controller/Notifier）を介して行う。

### 3.4 非同期処理 & エラーハンドリング
- `async` / `await` を適切に使用し、未処理の非同期例外（Unhandled Exception）を残さない。
- DB処理の結果は `AsyncValue`（Riverpod使用時）や `Result` 型でラップし、ローディング・エラー・成功状態をUI側で網羅的に表現する。
- ユーザー向けのわかりやすいエラー表示と、開発用の詳細ログ出力を分離する。

---

## 4. よく使うコマンド (Common Commands)

```bash
# 依存パッケージの取得
flutter pub get

# コード生成 (Drift, freezed, riverpod_generator)
dart run build_runner build --delete-conflicting-outputs

# 静的解析 & フォーマット
flutter analyze
dart format .

# テスト実行
flutter test

# キャッシュクリア & 再同期
flutter clean && flutter pub get
```

---

## 5. Git運用 (Git Workflow)
- **指示時の一括自動化**: 「コミットして」等の指示があった場合は、変更内容を論理的な単位（適切な粒度）に分割してステージング・コミットを作成し、リモートブランチへ `git push` まで自動で完結させること。

---

## 6. AIエージェント行動規範 (AI Guidelines)
1. **既存コードとの整合性**: 新規コード提案前に、既存のディレクトリ構成・Riverpod/Driftのパターン・命名規則を必ず踏襲すること。
2. **完全なコードの提供**: コード変更時は過度な省略記法（`// ... existing code ...`）を避け、差分または完全なコードブロックを提示すること。
3. **不要なパッケージの追加抑止**: 安易に新しい `pubspec.yaml` の依存関係を増やさず、標準機能や既存ライブラリでの実装を優先すること。
4. **型安全性の重視**: `dynamic` の安易な使用を避け、厳格に型付けを行うこと。

## 7. 学習方針
- 本プロジェクトは **Flutter の学習・習得を兼ねた個人開発プロジェクト** です。
- 開発者は Flutter 未経験のため、コード提示だけでなく **「なぜその書き方をするのか」「裏でどのような仕組みが動いているのか」** を必要に応じて噛み砕いてわかりやすく解説してください。
- Flutterの宣言的な書き方を学びたいため、都度チェックを行なってください。
