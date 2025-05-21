# Elepay iOS SDK Release

---

# Elepay iOS SDK 发布流程

## Elepay iOS 源码编译

当前仓库为 Elepay iOS SDK 外部分发仓库，不提供源码。  
源码仓库中通过 CI 打包，获取 `Release-<VERSION>.zip` 产物。

## template generate

获取 `Release-<VERSION>.zip` 产物并拖动到当前工程后，通过 `/ci_scripts/build.sh` 脚本生成包管理配置文件。

注意事项：确保当前工程 VERSION 文件内容与 zip 产物的后缀一致。

## 发布流程

1. 确认版本号
2. 提交代码到远程
3. Release Swift Package
   - 打 Tag
   - 把 zip 解压后的产物上传到 Release 附件中
4. Release Cocoapods
   - 执行 `/ci_scripts/cocoapods-publish.sh` 脚本
