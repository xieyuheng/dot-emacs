# My ~/.emacs file

> I suppose you could call that a personality.
> Each machine has its own, unique personality
> which probably could be defined as
>   the intuitive sum total of everything
>   you know and feel about it.
> This personality constantly changes,
> usually for the worse, but sometimes
> surprisingly for the better, and it is this personality
> that is the real object of motorcycle maintenance.
>
> -- "Zen and The Art of Motorcycle Maintenance"

## 键绑定

### 文件

| 快捷键            | 说明                 | 函数                    | 原生命令                   |
|-------------------|----------------------|-------------------------|----------------------------|
| `C-x C-s`         | 保存，显示文件名摘要 | `x-save-buffer`         | `save-buffer`              |
| `C-s C-x`         | 保存（备用键）       | `x-save-buffer`         | 无                         |
| `C-x k`           | 关闭当前 buffer      | `x-kill-current-buffer` | `kill-buffer`              |
| `C-x C-h`         | 全选                 | `mark-whole-buffer`     | `describe-prefix-bindings` |

### 窗口 / 导航

| 快捷键    | 说明        | 函数                 | 原生命令         |
|-----------|-------------|----------------------|------------------|
| `C-o`     | 下一窗口    | `(other-window +1)`  | `open-line`      |
| `C-.`     | 下一 buffer | `next-buffer`        | 无               |
| `C-,`     | 上一 buffer | `previous-buffer`    | 无               |
| `M-p`     | 上一段落    | `backward-paragraph` | 无               |
| `M-n`     | 下一段落    | `forward-paragraph`  | 无               |
| `<prior>` | 上滚 1 行   | `(scroll-down 1)`    | 半屏上翻         |
| `<next>`  | 下滚 1 行   | `(scroll-up 1)`      | 半屏下翻         |

### 搜索 / 替换

| 快捷键         | 说明           | 函数                     | 原生命令          |
|----------------|----------------|--------------------------|-------------------|
| `C-t`          | 增量搜索       | `isearch-forward`        | `transpose-chars` |
| `C-t` (搜索中) | 继续搜索下一个 | `isearch-repeat-forward` | 无                |
| `M-i`          | 交互替换       | `query-replace`          | `tab-to-tab-stop` |

### 编辑

| 快捷键   | 说明                 | 函数                     | 原生命令            |
|----------|----------------------|--------------------------|---------------------|
| `C-;`    | toggle 注释/取消注释 | `x-toggle-comment`       | 无                  |
| `C-M-u`  | 填充段落             | `fill-region`            | `backward-up-list`  |
| `C-M-y`  | 粘贴系统剪贴板       | `x-paste-from-clipboard` | `yank-pop`          |
| `C-M-g`  | toggle 行截断        | `toggle-truncate-lines`  | 无                  |
| `C-M-w`  | 清理空白字符         | `whitespace-cleanup`     | `append-next-kill`  |
| `C-h`    | 智能补全             | `hippie-expand`          | `help-command` 前缀 |
| `<C-f1>` | 光标处转 kebab-case  | `x-convert-to-kebab`     | 无                  |
| `<C-f2>` | 光标处转 snake_case  | `x-convert-to-snake`     | 无                  |

### C-s 前缀键

> 以下 `C-s C-e`/`C-s C-s`/`C-s C-w` 遵循 toggle 模式：按一次进入，同键再按一次返回原 buffer。

| 快捷键    | 说明                      | 函数                             | 原生命令                          |
|-----------|---------------------------|----------------------------------|-----------------------------------|
| `C-s`     | 自定义前缀键              | anonymous keymap                 | `isearch-forward`（已挪到 `C-t`） |
| `C-s C-c` | 克隆 frame                | `clone-frame`                    | 无                                |
| `C-s C-e` | 当前目录开 eshell         | `open-new-eshell-in-current-dir` | 无                                |
| `C-s C-j` | 跳转 file:line:column     | `x-jump-to-file`                 | 无                                |
| `C-s C-w` | 打开 ranger 文件管理器    | `ranger`                         | 无                                |

#### 局部覆盖

| 快捷键    | 模式              | 说明               | 函数                          |
|-----------|-------------------|--------------------|-------------------------------|
| `C-s C-e` | eshell-mode        | 返回上一 buffer    | `previous-buffer`             |
| `C-s C-s` | markdown-mode      | 编辑代码块         | `markdown-edit-code-block`    |
| `C-s C-s` | edit-indirect-mode | 提交间接编辑       | `edit-indirect-commit`        |
| `C-s C-w` | ranger-mode        | 下一窗口           | `other-window`                |
| `C-s C-x` | ranger-mode        | 禁用 save-buffer   | `(lambda () (interactive))`   |

### 括号 / S-表达式

| 快捷键 | 说明                    | 函数               | 原生命令             |
|--------|-------------------------|--------------------|----------------------|
| `M-[`  | 切换括号 ()→[]→{}→() | `x-cycle-brackets`           | `backward-paragraph`               |
| `M-a`  | mark-sexp               | `mark-sexp`                  | `backward-sentence`                |
| `M-e`  | backward-sexp           | `backward-sexp`              | `forward-sentence`                 |
| `M-s`  | forward-sexp            | `forward-sexp`               | `center-line`                      |
| `M-q`  | backward-up-list        | `backward-up-list`           | `fill-paragraph`                   |
| `M-r`  | raise-sexp              | `paredit-raise-sexp`         | `move-to-window-line-top-bottom`   |
| `M-c`  | splice-sexp             | `paredit-splice-sexp`        | `capitalize-word`                  |
| `M-"`  | 加双引号                | `paredit-meta-doublequote`   | 无                                 |
| `C-M-9` | 外层加括号             | `paredit-wrap-round`         | 无                                 |
| `<C-right>` | 向前吞              | `paredit-forward-slurp-sexp` | `right-word`                       |
| `<C-left>`  | 向前吐              | `paredit-forward-barf-sexp`  | `left-word`                        |
| `<C-M-right>` | 向后吐             | `paredit-backward-barf-sexp` | 无                                 |
| `<C-M-left>`  | 向后吞             | `paredit-backward-slurp-sexp` | 无                                |

paredit 内解绑：`C-j` `<RET>` `C-M-u` `C-M-d` `C-M-p` `C-M-n` `;`

### 已解绑

| 快捷键       | 原生命令                  |
|--------------|---------------------------|
| `M-t`        | `transpose-words`         |
| `M-j`        | `indent-new-comment-line` |
| `M-k`        | `kill-sentence`           |
| `` M-` ``    | `tmm-menubar`             |
| 全部鼠标事件 | 各种                      |

## License

[GPLv3](LICENSE)
