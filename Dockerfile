# ベースイメージとしてPythonを使用
FROM python:3.13

# Gitをインストール
RUN apt-get update && apt-get install -y git

# 作業ディレクトリを設定
WORKDIR /app

# リポジトリをクローン
RUN git clone --depth 1 https://github.com/microsoft/markitdown.git

# 必要なパッケージをインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Jupyter lab環境設定
## ポートを公開
EXPOSE 8888

## Jupyter Labを起動
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
