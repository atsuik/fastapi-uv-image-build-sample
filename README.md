# FastAPI UVコンテナビルドサンプル

このプロジェクトは、[uv](https://github.com/astral-sh/uv)パッケージマネージャを使用してFastAPIアプリケーションをDockerコンテナにビルドするサンプルです。

## 概要

- FastAPIベースの簡単なウェブAPIサーバー
- uvパッケージマネージャを使用した依存関係管理
- マルチステージビルドを活用したDockerコンテナ化

## 環境要件

- Docker
- uv（ローカル開発時）

## セットアップ方法

### Dockerを使用する場合

1. リポジトリをクローン：
   ```
   git clone <リポジトリURL>
   cd fastapi-uv-image-build
   ```

2. Dockerイメージをビルド：
   ```
   docker build -t fastapi-uv-app .
   ```

3. コンテナを実行：
   ```
   docker run -p 8000:8000 fastapi-uv-app
   ```

### ローカル開発（uvを使用）

1. リポジトリをクローン：
   ```
   git clone <リポジトリURL>
   cd fastapi-uv-image-build
   ```

2. 依存関係をインストール：
   ```
   uv sync
   ```

3. アプリケーションを実行：
   ```
   fastapi run main.py --port 8000
   ```

## API使用方法

アプリケーションが起動後、ブラウザで http://localhost:8000 にアクセスすると、JSONレスポンス `{"message": "Hello World"}` が表示されます。

## プロジェクト構成

- `main.py` - FastAPIアプリケーションのエントリーポイント
- `pyproject.toml` - Pythonプロジェクト設定と依存関係定義
- `uv.lock` - uvによって生成された依存関係ロックファイル
- `Dockerfile` - マルチステージビルド用のDockerファイル

## 特徴

- マルチステージDockerビルドによる軽量なコンテナイメージ
- uvを使用した高速な依存関係インストール
- 依存関係のロックによる再現可能なビルド
