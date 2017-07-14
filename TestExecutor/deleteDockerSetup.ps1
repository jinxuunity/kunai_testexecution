﻿param (
    [switch] $reloadkatana = $false,
    [switch] $reloadfileserver = $false,
    [switch] $reloadkatanabase = $false
)

docker rm docker_api_1
docker rm docker_server_1
docker rm docker_postgres_1
docker rmi -f docker_server
docker rmi -f docker_api


if ($reloadkatana -eq $true) {
    docker rm $(docker ps -a -q --filter="name=katana")
    docker rmi docker_katana
    docker rmi docker_katana_artifacts
    docker rmi docker_katana_slave
    docker rmi docker_katana_mysql
}

if ($reloadkatanabase -eq $true) 
{
    docker rmi katana_base
}

if ($reloadfileserver -eq $true) {
	docker rm docker_fileserver_server_1
	docker rmi docker_fileserver_server
	docker rm docker_fileserver_proxy_1
	docker rmi docker_fileserver_proxy
}