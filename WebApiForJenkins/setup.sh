image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd WebApiForJenkins
git pull --rebase origin master;
docker stop WebApiForJenkins;
docker rm WebApiForJenkins;
docker build -t WebApiForJenkins:$image_version .;
docker images;
docker run -p 10001:80 -d --name WebApiForJenkins WebApiForJenkins:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs WebApiForJenkins;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)