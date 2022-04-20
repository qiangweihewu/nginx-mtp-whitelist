# nginx-mtproxy
## 此脚本基于[https://hub.docker.com/r/ellermister/nginx-mtproxy](https://hub.docker.com/r/ellermister/nginx-mtproxy)和[https://github.com/ellermister/mtproxy](https://github.com/ellermister/mtproxy)和 [https://github.com/xb0or/nginx-mtproxy]修改


## 一键脚本
**使用脚本前请确认curl已安装**
```
bash <(curl -sSL "https://raw.githubusercontent.com/qiangweihewu/nginx-mtp-whitelist/main/mtp-run.sh")
```

## 其他命令

### Stop service / 停止服务

```
docker stop nginx-mtproxy
```

### Start service / 启动服务

```
docker start nginx-mtproxy
```

### Restart service / 重启服务

```
docker restart nginx-mtproxy
```

### Delete service / 删除服务

```
docker rm nginx-mtproxy
```

### Auto Run / 开机自启

```
docker update --restart=always nginx-mtproxy
```
