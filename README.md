

## 准备工作

1.安装 FVM
```
dart pub global activate melos
```

2.使用 FVM 分别安装官方的3.22版本， 以及鸿蒙社区的 3.22.0 版本
3.搭建 Flutter鸿蒙开发环境，参考文章《鸿蒙Flutter实战：01-搭建开发环境》

## 先使用官方 SDK 来初始化项目

>创建目录

```bash
# 创建项目目录
mkdir flutter-ohos-demo
```

> 设置使用的 Flutter SDK 版本
> 推荐在 VsCode 的命令行中执行以下命令，这将创建 .fvm 目录, .vscode/setting.json 文件, 和.fvmrc 文件

```bash
fvm use 3.22.0
```
> 初始化工作区间

创建目录，项目结构如下所示：

```bash
.
├──  packages
│   ├── apps  #该目录用于存放各端应用壳工程
│   ├── common #该目录用于存放公共库，均为纯 dart 代码，不依赖于 ios/android 等原生实现
│   │   ├── domains #领域对象，存放各类实体文件，如枚举/模型/vo/事件等
│   │   ├── extensions #存放扩展类文件，对于类的扩展方法/属性
│   │   ├── services #服务类：如请求服务/授权服务/缓存服务/平台调用服务/路由服务/工具类等
│   │   └── widgets #通用小型 widgets, 纯dart编写的 Flutter UI 组件
│   ├── components #封装组件库，可以依赖于第三方库/第三方插件，或依赖于 plugins中的插件
│   │   ├── image_uploader
│   │   └── player
│   ├── modules
│   │   ├── address
│   │   ├── home
│   │   ├── me
│   │   ├── message
│   │   ├── order
│   │   ├── shop
│   │   └── support
│   └── plugins #插件库，自行封装的插件库，依赖于原生平台(ios/android)的代码
│       └── printer
├── README.md
├── melos.yaml
└── pubspec.yaml
```

> 运行 melos bootstrap

```
melos bootstrap
```

在各个 package 初始化代码，如在 `packages/common/domains` 目录运行

```bash
fvm flutter create --template package .
```

## 配置 App 壳工程

新建两个壳工程，一个为 app，另外一个为 ohos_app

进入 `package/apps/app` 目录, 创建 app 项目，该项目为一个 App 项目，支持各平台（ios/android/mac 等）

```bash
fvm flutter create --template app --org com.moguyun.flutter app
```

修改 pubspec.yaml, 增加依赖项

 ```yaml
  services:
    path: '../../common/services'
  domains:
    path: x'../../common/xxi
  widgets:
    path: '../../common/widgets'

  home:
    path: '../../modules/home'
  me:
    path: '../../modules/me'
  support:
    path: '../../modules/support'
 ```

运行以下命令，安装依赖

 ```
fvm flutter pub get
 ```

 ## 配置鸿蒙壳工程

首先在 flutter-ohos-demo 项目根目录，将 Flutter 版本切换到鸿蒙化的版本

```
fvm use custom_3.22.0
```

进入 packages/apps 目录，创建 ohos_app 项目

```bash
fvm flutter create --template app --platforms ohos --org com.moguyun.flutter app
```

同样增加依赖项