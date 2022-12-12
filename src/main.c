// wayne-tao@Outlook.com
/*
* 尝试构建一种直观的方式，展示基于符号执行的模糊测试的效率；
* maze地图在一开始定义，是因为考虑到fuzz频繁读文件比较消耗资源；可以直接修改maze数组，和宽高
* 
*/

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <stdbool.h>

enum mode
{
	forward,	  //只允许输入的指令让其前进，否则就认为失败
	forward_back, //允许无效指令，即可以前进，可以后退，也可以原地不动
} MAZE_MODE;

#define INPUT_SIZE 512

//maze数组实际的宽高
#define MAZE_H 4
#define MAZE_W 6
//
char maze[MAZE_H][MAZE_W] = {	"+---+",
				"| |$|",
				"|   |",
				"+---+" };

void draw(){
	for(int i=0;i<MAZE_H;i++){
		for(int j=0;j<MAZE_W;j++){
			printf("%c",maze[i][j]);
		}
		printf("\n");
	}
//printf("+---+\n");
    
}

int main (int _argc, char *_argv[])
{
	MAZE_MODE = 0;
#ifdef MAZE_BACK
	MAZE_MODE = 1;
#endif
	int o_x = 1, o_y = 1;
	int c_x = 1, c_y = 1;
	char input[INPUT_SIZE];
	maze[c_y][c_x] = 'X';
#ifndef FUZZ_MAZE
	draw();
#endif
	scanf("%s", input);
	for (int i = 0; i < INPUT_SIZE;i++){
		if(MAZE_MODE == 1)
			maze[c_y][c_x] = ' ';
		o_x = c_x;
		o_y = c_y;
		switch (input[i])
		{
			case 'w':
				c_y--;
				break;
			case 's':
				c_y++;
				break;
			case 'a':
				c_x--;
				break;
			case 'd':
				c_x++;
				break;
			default:
				printf("Wrong command!(only w,s,a,d accepted!)\n");
				printf("You lose!\n");
				exit(-1);
		}
		if(maze[c_y][c_x] == '$'){
			//终点
			printf("============= U Win! ============\n");
#ifndef FUZZ_MAZE
			//draw();
#else
#endif
			assert(0);
		}
		else if (maze[c_y][c_x] == ' ')
		{
			//可以前进
		}
		// else if(maze[y][x] == 'X'){
		// 	//只有forward模式才会出现这种情况
		// 	printf("JUST CAN GO FORWARD!\n");
		// 	printf("Ur back, u lose!\n");
		// 	exit(-2);
		// }
		else{
			//墙
			c_x = o_x;
			c_y = o_y;
			if(MAZE_MODE == 0){
				printf("JUST CAN GO FORWARD!\n");
				printf("U lose!\n");
				exit(-2);
			}
		}
		maze[c_y][c_x] = 'X';
#ifndef FUZZ_MAZE
		draw();
#endif
	}
	printf("You lose\n");
}
