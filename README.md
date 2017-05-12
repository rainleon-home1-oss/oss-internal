
# oss-internal
Template for internal environment

## gitlab

    # just descript the token access files in gitlab private repo
    # for obtaining this private_token,you should copy from http://gitlab.XXXXX.XXXX-> Profile Settings->Account->Private Token
    # or `curl --request POST "http://gitlab.XXXX.XXXX/api/v3/session?login={邮箱}&password={密码}"`
    export GIT_SERVICE_TOKEN=

GIT_SERVICE_TOKEN 用来在CI流程中进行相关环境文件的下载，考虑到安全性，相关环境的信息会以私有项目的形式存在，如oss-internal.而项目里涉及到文件获取的地方，需要加上这个token参数方可。
    
## jenkins
这里的信息用来保存jenkins的CI/CD过程相关的信息。

- id_rsa用来做部署应用登录目标机器的认证信息，
- 认证可以分环境，这里默认会读取对应环境，如stagging下的认证，没有则读取jenkins根目录下的认证文件
- 对于k8s，这里用来维护k8s的CLI以及认证信息

## jira

保存内部jira的项目唯一标志以及用户名和密码

## maven

- 保存maven运行时的变量，包括nexus的地址，sonar的地址，checkstyle的地址等
- 保存maven配置文件
- 保存maven安全相关的配置

## docker

如本地docker的私有仓库需要做用户名&密码的认证，可通过config.json来进行认证信息的分发





## 注意
- 此项目是模版项目，所需配置需要对应相关功能实现进行配置。
