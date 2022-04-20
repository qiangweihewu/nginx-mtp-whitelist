#!/bin/bash                                                                                                  
read -e -p "请输入链接端口(默认3763) :" port
if [[ -z "${port}" ]]; then
port="3763"
fi

secret=$(cat /proc/sys/kernel/random/uuid |sed 's/-//g')
read -e -p "请输入密码(默认随机生成) :" secret
echo -e "密码："
echo -e "$secret"
fi

       
      echo -e "正在安装依赖: Docker... "
      echo y | bash <(curl -L -s https://raw.githubusercontent.com/xb0or/nginx-mtproxy/main/docker.sh)
      echo -e "正在安装nginx-mtproxy... "
      docker run --name nginx-mtproxy -d -e secret="$secret" -p 80:80 -p $port:$port ellermister/nginx-mtproxy:latest
        ;;
    *)
echo -e "正在安装依赖: Docker... "
echo y | bash <(curl -L -s https://cdn.jsdelivr.net/gh/xb0or/nginx-mtproxy@main/docker.sh)

echo -e "正在安装nginx-mtproxy... "
docker run --name nginx-mtproxy -d -e secret="$secret" -p 81:80 -p $port:3763 ellermister/nginx-mtproxy:latest
        ;;
    esac

echo -e "正在设置开机自启动... "
docker update --restart=always nginx-mtproxy
# echo -e "输入 docker logs nginx-mtproxy 获取链接信息"

    public_ip=$(curl -s https://api.ip.sb/ip --ipv4)
    [ -z "$public_ip" ] && public_ip=$(curl -s ipinfo.io/ip --ipv4)
    domain_hex=$(xxd -pu <<< $domain | sed 's/0a//g')
    client_secret="ee${secret}${domain_hex}"
    echo -e "服务器IP：\033[31m$public_ip\033[0m"
    echo -e "服务器端口：\033[31m$port\033[0m"
    echo -e "MTProxy Secret:  \033[31m$client_secret\033[0m"
    echo -e "TG认证地址：http://${public_ip}:81/add.php"
    echo -e "TG一键链接: https://t.me/proxy?server=${public_ip}&port=${port}&secret=${client_secret}"
