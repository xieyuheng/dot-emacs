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
| `C-x <backspace>` | 删除前一个字符       | `delete-backward-char`  | `backward-kill-sentence`   |

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
| `C-c C-c` | 克隆 frame  | `clone-frame`        | 有些 mode 有绑定 |

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

### 跳转 / Shell

| 快捷键    | 说明                      | 函数                             | 原生命令           |
|-----------|---------------------------|----------------------------------|--------------------|
| `C-s C-j` | 跳转到 `file:line:column` | `x-jump-to-file`                 | `C-s` 已改为前缀键 |
| `C-s C-e` | 当前目录开 eshell         | `open-new-eshell-in-current-dir` | 同上               |

### 前缀键

| 快捷键 | 说明         | 函数      | 原生命令                          |
|--------|--------------|-----------|-----------------------------------|
| `C-s`  | 自定义前缀键 | `C-s-map` | `isearch-forward`（已挪到 `C-t`） |

### 括号 / S-表达式

| 快捷键 | 说明                    | 函数               | 原生命令             |
|--------|-------------------------|--------------------|----------------------|
| `M-[`  | 切换括号 ()→[]→{}→() | `x-cycle-brackets` | `backward-paragraph` |
| `M-a`  | mark-sexp               | `mark-sexp`        |                      |
| `M-e`  | backward-sexp           | `backward-sexp`    |                      |
| `M-s`  | forward-sexp            | `forward-sexp`     |                      |
| `M-q`  | backward-up-list        | `backward-up-list` |                      |

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
