#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <stdbool.h>

//lseek(fd,0,SEEK_SET);
//shorter words go first

void swap(int* ap, int* bp){
	
	
}

void main(int argc, char *argv[]){
	
	if(argc != 2)exit(0);
	
	//open file
	int fd = open(argv[1], O_CREAT | O_RDWR, 0666);
	
	
	//for the first iteration, get amount of words and the size of the smallest one
	char c;
	int words_count = 0;
	int smallest_word;
	int current_word = 0;
	while(read(fd,&c,1)){
	
		if((int) c == 32){
			if(current_word < smallest_word) smallest_word = current_word;
			current_word = 0;
			words_count++;
		}
		else current_word++;
	}
	//since word count goes up by each space and final one doesnt have one after, we add up the last one statically
	words_count++;
	
	lseek(fd,0,SEEK_SET);
	
	//array of indexes: position of first char of each word
	int positions[words_count];
	char starters[words_count];
	//assume first word doesnt have anything before it
	positions[0] = 1;
	int index = 1;
	int i = 1;
	char prev;
	while(read(fd,&c,1) == 1){
		if(index == 1) starters[0] = c;
		else if (((int) prev == 32)) starters[i-1] = c;
		index++;
		if((int) c == 32){
			positions[i] = index;
			i++;
		}
		prev = c;
	}
	
	for(int j = 0; j < words_count; j++)printf("%d %c\n ",positions[j],starters[j]);
	
	//iterate for the size of smallest word
	//nested loop to convert all chars of n-1 position into int and bubble sort, should be possible to do just casting as int
	//maybe just use smallest word as limit, in each comparision, if first letter is equal, move to the next until limit then dont care
	for(int letter = 0; i < words_count -1; letter++){
		bool swapped = false;
	}
	
	//printf("The folder %s is %d words long and the smallest one is %d characters\n", argv[1], words_count,smallest_word);
}
