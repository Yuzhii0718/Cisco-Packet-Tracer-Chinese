# Cisco-Packet-Tracer-Chinese

* 继承来自 [Cisco-Packet-Tracer-Chinese](https://github.com/EmotionalAmo/Cisco-Packet-Tracer-Chinese) 的工程文件
* 在 8.2.2 版本可以使用
* 人工优化了部分翻译

## 如何使用

下载 Chinese.ptl

将文件需要放到:
Windows: `C:\Program Files\Cisco Packet Tracer 8.2.2\languages\`

MacOS: `/Applications/Cisco Packet Tracer/Cisco Packet Tracer.app/Contents/LANGUAGES`

在放置文件后还需要进入软件下将 Languages 栏设为 Chinese.ptl

Options->Preferences->Interface->Languages->Chinese->Change Language

## 优化翻译

使用 packet tracer 安装目录文件下的 `bin\linguist` 打开`languages\template.ts`文件

### 打包文件

在选项栏的 `文件` 里找到 `发布为...`
导出文件时选择 `ALL files` 格式并把文件后缀改成 `ptl`
现在，你就可以把导出的 *.ptl 放到 languages 文件夹下检查自己的成果了

然后，提交pr，或者fork一个新的版本

### 说明

某些不用翻译的字段（比如名词，专业术语），可以直接使用英文，不用翻译，但是如果直接删除，将显示为空白，所以请填充原文
