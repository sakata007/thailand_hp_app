# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

-   Ruby version

-   System dependencies

-   Configuration

-   Database creation
    1, ルートディレクトリに.env ファイルを作成、DB 情報を設定
    2, rails db:create を実行し DB 作成
    3, rails db:migrate を実行しマイグレーション実施

-   Database initialization

-   How to run the test suite
    ./bin/dev を実行
    URL ＋/letter_opener 　でメール送信確認可能

-   Services (job queues, cache servers, search engines, etc.)

-   Deployment instructions

-   ...

-   tailwindcss を読み込ませるまでの流れ
    　　１, node -v # Node.js のバージョン確認
    　　２,npm -v # npm のバージョン確認
    　　３,sudo npm install -g yarn # yarn インストール
    　　４,yarn add tailwindcss #tailwindcss のインストール
