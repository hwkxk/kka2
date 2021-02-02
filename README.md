## Aria2c+AriaNg 离线下载并自动上传到Rclone挂载的网盘


部署到容器平台需要设置的变量：
`RCLONE_CONFIG` 【RCLONE配置信息】
`RCLONE_DESTINATION` 【上传路径 如：mypan1:downloaded (mypan1是在配置RCLONE时设置的name)】
`ARIA2C_SECRET`【ARIA2C 访问密钥】

# RCLONE_CONFIG Rclone配置信息获取方法

在windows挂载onedrive举例

下载Rclone：[https://rclone.org/downloads/](https://rclone.org/downloads/)

解压打开、在此目录下运行CMD：如图：
![解压在地址栏输入cmd](https://s3.ax1x.com/2021/02/02/ynb8E9.jpg)

在cmd里输入
```conf
rclone config
```
注意：如果运行cmd输入rclone config 提示'rclone'不是内部或外部命令，也不是可运行的程序或批处理文件。
说明cmd没在rclone目录下运行,或者将rclone.exe移动到C:/windows/system32文件夹下然后打开系统cmd运行命令！

执行后的命令：

```conf
D:\rclone-v1.51.0-windows-amd64>rclone config  //这里是开头的 rclone config  配置rclone
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n   //这里输入n 新建远程挂载
name> mypan1  //名称（自定义）记住设置 ，设置RCLONE_DESTINATION变量需要用到
...
...后面步骤省略，自行上百度、Google搜索 Windows使用rclone挂载xxxx教程。
...
```
配置完成后就可以在 `C:\Users\用户名\.config\rclone\rclone.conf` 找到配置文件

打开配置文件后在每一项后面添加`\n`
```conf
[xxxx] \n
type =  xxx \n
token = {xxx} \n
drive_id = xxx \n
drive_type = xxx \n
```
如图：

[![ynXhzq.md.jpg](https://s3.ax1x.com/2021/02/02/ynXhzq.md.jpg)](https://imgchr.com/i/ynXhzq)

```conf
type =  xxx \n
token = {xxx} \n
drive_id = xxx \n
drive_type = xxx \n
```
# 配置平台的环境变量

> 你可以在这找到免费的平台进行部署： https://free-for.dev/

部署好后，新建环境变量 `RCLONE_CONFIG` 把上面添加好`\n`的配置内容全部复制进去。

设置 `RCLONE_DESTINATION` 为OneDrive网盘上传路径，如：`mypan1:downloaded`

设置 `ARIA2C_SECRET` 为ARIA2C访问密钥，如：`123456`

以 heroku 平台为例（注意：现在在heroku部署有很大几率被封号，请尝试更换其他平台部署）

[![yuSbGQ.md.jpg](https://s3.ax1x.com/2021/02/02/yuSbGQ.md.jpg)](https://imgchr.com/i/yuSbGQ)


# 修改于
https://github.com/maple3142/aria2c-ariang
