# プロジェクト名を定義
PROJECT_NAME = my-app

# Dockerイメージ名を定義
IMAGE_NAME = $(PROJECT_NAME):latest

# Docker Composeサービス名を定義
SERVICE_NAME = react-app

# Reactアプリケーションを作成するターゲット
create-react-app:
	npx create-react-app $(PROJECT_NAME)

# Dockerイメージをビルドするターゲット
build:
	docker-compose build

# コンテナを起動するターゲット
up:
	docker-compose up

# コンテナをバックグラウンドで起動するターゲット
up-detached:
	docker-compose up -d

# コンテナを停止するターゲット
down:
	docker-compose down

# Dockerイメージを削除するターゲット
clean:
	docker-compose down --rmi all

# すべてのキャッシュを削除してDockerイメージを再ビルドするターゲット
rebuild:
	docker-compose down --rmi all
	docker-compose build
	docker-compose up

.PHONY: create-react-app build up up-detached down clean rebuild
