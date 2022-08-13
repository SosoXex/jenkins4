<!DOCTYPE html>
<html>
<head>
	<title>WAR Web Service</title>
	<link href="http://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
	<link href="static/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>WAR Web Service V.6.0 with publisher and builder instructions</h1>
	<h2>Publisher</>
	<p>rm -rf /tmp/srv && mkdir -p /tmp/srv && cd /tmp/srv
docker rm app -f
ghhost='172.31.23.200:8123'
docker rmi $ghhost/app:$ghvar -f
docker login $ghhost -u $ghuser -p $ghpass
docker pull $ghhost/app:$ghvar
docker run --name app -d -p 8080:8080 $ghhost/app:$ghvar</p>
<h2>Builder</>
	<p>rm -rf /tmp/build && mkdir -p /tmp/build && cd /tmp
git clone https://github.com/SosoXex/jenkins4.git build
cd build
git checkout $ghvar <-- here we as well could use <b>reset --hard</b>
mvn package -DbuildDirectory=$PWD
ghhost='172.31.23.200:8123'
docker build -t app:$ghvar .
docker login $ghhost -u $ghuser -p $ghpass
docker tag app:$ghvar $ghhost/app:$ghvar
docker push $ghhost/app:$ghvar</p>
	<ul>
		<li><a href="http://localhost:8080/wwp-1.0.0/webapi/service">http://localhost:8080/wwp-1.0.0/webapi/service</a></li>
		<li><a href="http://localhost:8080/wwp-1.0.0/webapi/service/hello">http://localhost:8080/wwp-1.0.0/webapi/service/hello</a></li>
		<li><a href="http://localhost:8080/wwp-1.0.0/webapi/service/time">http://localhost:8080/wwp-1.0.0/webapi/service/time</a></li>
		<li><a href="http://localhost:8080/wwp-1.0.0/webapi/service/send">http://localhost:8080/wwp-1.0.0/webapi/service/send</a> (Accessible using POST)</li>
		<li><a href="http://localhost:8080/wwp-1.0.0/webapi/service/send/rowan">http://localhost:8080/wwp-1.0.0/webapi/service/rowan</a> (Accessible using POST)</li>
	</ul>
</body>
</html>