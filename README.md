# infra
オンプレインフラ及びクラウドインフラの管理

下記については別リポジトリにて管理
* [自宅のルーター及びスイッチ類の構成管理](https://github.com/toshi-click/home_network_ansible)
* [物理サーバー及びVMサーバーの構成管理(ubuntu)](https://gitlab.com/toshi_click/server/ansible_for_server)
* [WSLの構成管理(ubuntu)](https://github.com/toshi-click/ansible_for_wsl)
* [raspiなどのIoT機器の初期構築(ubuntu)](https://github.com/toshi-click/server-init)

## terraformの実行
#### AWSCLIインストール～設定
```bash
$ sudo apt install python3-pip
$ sudo apt install awscli
$ aws configure
AWS Access Key ID [None]: 自分が設定したもの
AWS Secret Access Key [None]: 自分が設定したもの
Default region name [None]: ap-northeast-1
Default output format [None]: text
```

#### dockerで実行
```bash
AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
AWS_DEFAULT_REGION=$(aws configure get region)
docker pull hashicorp/terraform:0.15.3
cd this_repository
docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v $(pwd):/terraform -w /terraform -it --entrypoint=ash hashicorp/terraform:0.15.4

# terraformの実行を事前準備のDockerfileを使用して行う場合
```bash
docker build -t terraform ./
docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v $(pwd):/terraform -w /terraform -it terraform:latest

# tflintのローカル実行
tflint --config ./lint/.tflint.hcl;
```