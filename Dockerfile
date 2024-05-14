# ベースイメージ
FROM node:14

# アプリディレクトリを作成
WORKDIR /app

# パッケージファイルをコピー
COPY package.json /app
COPY package-lock.json /app

# 依存関係をインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY . /app

# アプリケーションをビルド
RUN npm run build

# 使用するポートを指定
EXPOSE 3000

# サーバーを起動
CMD ["npm", "start"]
