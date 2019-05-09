#!/bin/bash
if [[ "$(docker images -q xamin 2> /dev/null)" == "" ]]; then
echo -e "\e[96mDocker tag not found. Building docker image..."
echo -e "\e[39m"
docker build . -t xamin -f docker/Dockerfile
echo -e "\e[96mDocker image finished building."
echo -e "\e[39m"
cp docker/Dockerfile docker/Dockercache
else
	if cmp --silent docker/Dockerfile docker/Dockercache ; then
	 echo -e "\e[96mLatest version detected..."
	 echo -e "\e[39m"
	else
	 echo -e "\e[96mOld version detected. Installing new version..."
	 echo -e "\e[39m"
	 ./uninstall.sh
         docker build . -t xamin -f docker/Dockerfile
	 rm docker/Dockercache
	 cp docker/Dockerfile docker/Dockercache
	fi
fi
echo -e "\e[96mRunning xamin container..."
echo -e "\e[39m"
docker run -ti --rm --net=host -v $(pwd):/xamin:rw -u `id -u $USER`:`id -g $USER` xamin bash -c "cd xamin; bash"
