# MazeFuzz
提供一种迷宫的方式测试符号执行的效率，

## 文件说明
### run.sh
提供AFL模式脚本，
当然对于一些AFL衍生的fuzzer同样适用，已测试：[iJon]()、[mopt-afl]()、[qsym]()，可以在文件夹找到相应脚本。  

### create.c

## 食用方式
### 安装Fuzzer
如果已经是fuzz有经验可以略过这一步，如果是萌新可以看这篇安装AFL，并进行简单的了解：  
[AFL入门第一次测试](https://www.cnblogs.com/wayne-tao/p/11739420.html)  

### 编译环境
```bash
bash build.sh
```
正常情况下会生成三个文件：

### 运行测试
```bash
bash run.sh
```