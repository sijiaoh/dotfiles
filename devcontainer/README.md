## Devcontainer

このディレクトリはNeovim+Devcontainerでの開発のための設定及びコマンドを追加する。

## 前提

Devcontainerをプロジェクトごとに用意するのではなく、`~/work`ディレクトリ全体をDevcontainerに含めることで、すべてのプロジェクトを一つのDevcontainer内で開発したい。

そこで問題になるのが、プロジェクトごとに開放する必要のあるポートが異なる問題である。
Linuxであれば`--network=host`を使用することでこの問題を回避できるが、Macでは使用できない。

VSCodeのように自動でポートフォワードしてくれるツールがなかったので、せめて立ち上がったコンテナに対して動的にフォワードするポートを変えれるようにした。
そうでないとポートを追加するたびに環境を再構築する必要が出てきてしまう。

## コマンド

### devcreate

カレントディレクトリに`.devcontainer`を作成する。
必要に応じてカスタマイズする。

### devup

- `.devcontainer/forward_ports`に記載されているポートをローカルフォワード。
- コンテナを立ち上げる。

### devreset

既存のコンテナを削除してdevupする。

### devin

コンテナにzshで入る。

## SSH

- DevcontainerがPublishしているポートはssh接続用の2222のみである。
- 利便性のため、**コンテナはホストの`~/.ssh`をコンテナ内にマウントして使用する**。
- devupではローカルポートフォワードをするためにautosshを使用している。
  - そのためホストからパスワードなしでコンテナにsshで入れる必要がある。
  - `~/.ssh`を共有しているため、以下のコマンドを実行すれば良い。
  - `cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys`

## Rancher Desktop

コンテナ内のファイル所有者が正しく設定されない場合は、Preferences > Virtual Machine > Volumesでvirtiofsを選択する。
