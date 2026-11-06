# AIC

原始文件 `AIC.zip` 大小为 10,662,596,623 字节。由于 GitHub 对单个文件有限制，完整压缩包作为 Release 附件分成六卷保存。

## 下载与还原

1. 打开本仓库的 Releases，下载同一版本的 `AIC.zip.part000` 至 `AIC.zip.part005`，放在同一个目录。
2. 下载仓库中的 `Join-AIC.ps1`，也放在该目录。
3. 在 PowerShell 中进入该目录，运行 `powershell -ExecutionPolicy Bypass -File .\Join-AIC.ps1`。
4. 脚本会生成 `AIC.zip` 并验证 SHA-256。

原始文件 SHA-256：`00FD4EE5E715DB3AA6491B93E28D990B04F0D1A0CB0459287FB8C7E6B96C2C83`

此仓库为私有仓库；分卷文件在 Releases 中，不在 Git 提交历史里。
