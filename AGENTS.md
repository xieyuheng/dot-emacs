---
title: AI Agent 工作指南
---

**使用中文进行内部推理和思考。**

## 项目概述

个人 Emacs 配置（"x-emacs"），以 git repo 形式管理在 `~/.emacs.d`。通过 `manifest.txt` + `install.sh` 手动管理依赖，不使用 `use-package`/`straight.el`。

## 目录结构

```
~/.emacs.d/
├── early-init.el          # UI 前：包路径、var/ 重定向
├── init.el                # 入口：按顺序加载所有配置
├── install.sh             # 根据 manifest.txt 克隆/更新依赖
├── manifest.txt           # 所有依赖的 git URL
├── deps/                  # 克隆的依赖（gitignored）
├── var/                   # 运行时状态（gitignored）
├── src/
│   ├── x/                 # 自定义交互命令
│   ├── packages/          # 各包的配置
│   ├── langs/             # 各语言 mode 的配置
│   └── config-*.el        # 通用配置（按键、设置、字体、主题等）
```

## 代码规范

- 文件末尾使用 `(provide '功能名)`
- `init.el` 用 `add-to-list 'load-path` 后 `load`（不用 `require`）
- 私有函数用 `--` 前缀（如 `x-sidebar--find-window`）
- 不写注释，除非解释"为什么"——不解释"是什么"
- 键绑定文档写在 `README.md` 中，与代码保持同步

## 验证

- 用 `emacs --batch` 模式验证代码能否正常加载不报错

```
emacs --batch -l ~/.emacs.d/early-init.el -l ~/.emacs.d/init.el
```

## 依赖管理

- 依赖由 `./install.sh` 读取 `manifest.txt` 克隆到 `deps/` 目录
- 被 gitignore 的目录：`deps/`、`var/`、`eln-cache/`、`recentf`
