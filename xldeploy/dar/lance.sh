https://docs.xebialabs.com/xl-deploy/4.0.x/webserverPluginManual.html


cd deploy-ebk/

zip -r deploy-ebk.dar * -x webcontent1/.DS_Store .DS_Store

curl -uadmin:pass2000 -X POST -H "content-type:multipart/form-data" http://centosboxpro:4516/deployit/package/upload/deploy-ebk.dar -F fileData=@/Users/elmos/Downloads/deploy-ebk/deploy-ebk.dar
