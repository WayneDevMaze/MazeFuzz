# MazeFuzz
提供一种迷宫的方式测试符号执行的效率，希望通过这种方式为不同的fuzzer创造统一的结果标准。  

------
## 食用方式（以AFL为例）
### 安装Fuzzer —— AFL
如果已经是fuzz有经验可以略过这一步，如果是萌新可以看这篇安装AFL，并进行简单的了解：  
[AFL入门第一次测试](https://www.cnblogs.com/wayne-tao/p/11739420.html)   

### 编译环境  
```bash
cd afl
bash build.sh
```
正常情况下会生成四个文件：  
maze.back：gcc编译的程序，运行后退  
maze.back.afl：afl-gcc编译的程序，运行后退  
maze.forward：gcc编译的程序  
maze.forward.afl：afl-gcc编译的程序  

### 运行测试
如果只是想运行普通的maze进行测试，或者是检查crash是否正确：  
```bash
bash run.sh
```
如果是想运行afl进行测试：  
```bash
bash run.sh afl
```
如果有输入输出文件夹的需求：
```bash
bash run.sh afl in_dir_path out_dir_path
```

------
## 文件说明
### afl
`run.sh`:提供AFL模式脚本，如果对afl脚本有修改计划，就直接该这一段即可：`afl-fuzz -m none -t 250 -i afl/input -o afl/output ./maze.forward.afl`  
~~还需要加一些AFL衍生的fuzzer，目前计划是：[iJon]()、[mopt-afl]()、[qsym]()，可以在文件夹找到相应脚本。~~  

`build.sh`:如果想要改fuzzer，可以在基础上新加cc环境，或者直接对`FuzzCC=afl-gcc`进行修改。
宏定义参数：  
>-DFUZZ_MAZE:是否进行fuzz，影响程序是否展示界面，fuzz模式下是不展示的  
>-DMAZE_BACK:是否可以回退，如果可以回退，那么maze难度将增加  

### src
`main.c`:主程序，目前还没有实现draw函数。  
如果要对地图进行修改，直接在开头定义那里，改地图数组和数组对应的宽高的宏定义。  
