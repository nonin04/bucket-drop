# Architectural Guidelines & Project Rules: Bucket Drop

## プロジェクト概要 & 学習方針
- 本プロジェクトは **Flutter の学習・習得を兼ねた個人開発プロジェクト** です。
- 開発者は Flutter 未経験のため、コード提示だけでなく **「なぜその書き方をするのか」「裏でどのような仕組みが動いているのか」** を必要に応じて噛み砕いてわかりやすく解説してください。
- 公式のベストプラクティス（Flutter公式 / Riverpod公式）に沿った、保守性の高い書き方を優先して提示してください。

---

## プロンプト構文ルール (Prompt Syntax)
- **`@here` キーワードの解釈**:
  - プロンプト内に `@here` という記述が含まれている場合、ユーザーが**「現在 VS Code 等のエディタで開いて作業している対象ファイル（直近で変更中・参照中のメインファイル）」**を指していると判断してください。
  - プロジェクト構造や直前の会話の文脈、直近の変更履歴等から、現在作業中と思われるファイルを特定してコンテキストに含めて回答してください。

---

## 1. Feature-first (機能駆動) アーキテクチャの厳格適用

すべてのコードは `core/`（共通基盤）または `features/<feature_name>/`（個別機能）配下に配置します。
ルート直下に `models/`, `views/`, `controllers/` といったレイヤー単位のディレクトリを作成することは禁止します。

```text
lib/
├── core/                                # 全機能共通のインフラ・基盤
│   ├── database/                        # Driftデータベース定義・接続
│   ├── enums/                           # アプリ全体で共有する横断的Enum
│   └── constants/                       # 共通定数・テーマ・ユーティリティ
│
└── features/                            # 機能単位のモジュール
    └── <feature_name>/                  # (例: drop, bucket, analytics)
        ├── data/                        # データ永続化・クエリ・Repository実装
        │   ├── <feature>_repository.dart
        │   └── <feature>_drift_queries.drift
        ├── domain/                      # 業務ロジック・エンティティ・純粋モデル
        │   ├── <feature>.dart           # Freezed Entity
        │   └── <feature>_type.dart      # ドメイン専用Enum
        └── presentation/                # UI・状態管理
            ├── <feature>_controller.dart # Riverpod Notifier
            └── <feature>_screen.dart     # Flutter Widget
