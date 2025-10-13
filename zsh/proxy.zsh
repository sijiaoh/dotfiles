# ~/.zshrc.localでPROXY_IPを定義するとプロキシ設定が有効になる
PROXY_HTTP_PORT=${PROXY_HTTP_PORT:-1234}
PROXY_SOCKS_PORT=${PROXY_SOCKS_PORT:-1235}

if [ -n "${PROXY_IP:-}" ]; then
  export http_proxy=http://${PROXY_IP}:${PROXY_HTTP_PORT}
  export https_proxy=http://${PROXY_IP}:${PROXY_HTTP_PORT}
  export HTTP_PROXY=http://${PROXY_IP}:${PROXY_HTTP_PORT}
  export HTTPS_PROXY=http://${PROXY_IP}:${PROXY_HTTP_PORT}

  export all_proxy=socks5h://${PROXY_IP}:${PROXY_SOCKS_PORT}
  export ALL_PROXY=socks5h://${PROXY_IP}:${PROXY_SOCKS_PORT}

  export no_proxy="localhost,172.0.0.1"
  export NO_PROXY="localhost,172.0.0.1"
fi
