#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <stdbool.h>

//lseek(fd,0,SEEK_SET);
//shorter words go first

void swap(int w1, int w2, int* arr1, char* arr2, int* arr3){
	
	int itemp;
	char ctemp;

	//swap in positions array
	itemp = *(arr1+w2);
	 
	*(arr1+w2) = *(arr1+w1);

	*(arr1+w1) = itemp;
	

	//swap in starters array
	ctemp = *(arr2+w2);
	 
	*(arr2+w2) = *(arr2+w1);

	*(arr2+w1) = ctemp;
	
	//swap in sizes array 
	itemp = *(arr3+w2);
	 
	*(arr3+w2) = *(arr3+w1);

	*(arr3+w1) = itemp;
}

void main(int argc, char *argv[]){
	
	if(argc != 2)exit(0);
	
	//open file
	int fd = open(argv[1], O_CREAT | O_RDWR, 0666);
	lseek(fd,0,SEEK_SET);
	
	
	//for the first iteration, get amount of words and the size of the smallest one
	int chars = 0;
	char c;
	int words_count = 0;
	int smallest_word;
	int current_word = 0;
	bool prev = false;
	while(read(fd,&c,1) == 1){
		// printf("\nreading %c\n",c);
		chars = ++chars;
		if(prev && ((int)c != 0 || (int)c != 32)) ++words_count;
		if((int) c == 32){
			prev = true;
			if(current_word < smallest_word) smallest_word = current_word;
			current_word = 0;
			// words_count++;
		}
		else{
			current_word++;
			prev = false;
		}
	}
	//since word count goes up by each space and final one doesnt have one after, we add up the last one statically
	words_count++;
	

	// printf("\n\nWORDS COUNT %d\n\n", words_count);

	int positions[words_count];
	char starters[words_count];
	int sizes[words_count];
	char buffer[chars];
	
	lseek(fd,0,SEEK_SET);
	int buffindex = 0;
	while(read(fd,&c,1) == 1){
		if((int)c <= 10) c = 1;
		printf("added %d\n",(int)c);
		if((int)c != 0)buffer[buffindex++] = c;
		else break;
	}
	buffer[buffindex] = 32;

	//fill three arrays:
	//positions keeps indexes of first char of each word
	//starters keeps said chars
	//sizes keeps the size of each word

	//assume first word doesnt have anything before it
	positions[0] = 0;
	int size = 0;
	int words_written = 0;
	int fdp = 0;
	char previous_letter;
	lseek(fd,0,SEEK_SET);
	while(read(fd,&c,1)==1){
		if(fdp == 0) starters[0] = c;
		if (((int) previous_letter == 32)){
			starters[words_written] = c;
			positions[words_written] = fdp;
		}
		if((int) c == 32){
			sizes[words_written] = size;
			size = 0;
			words_written++;
		}
		else size++;
		previous_letter = c;
		fdp++;
	}
	
	sizes[words_written] = size;

	//-----BUBBLE SORT-----
	//subletter keeps track of how many letter deep we are comparing two words
	int subletter;
	for(int letter = 0; letter < words_count -1; letter++){
		bool swapped = false;
		//inner loop: in case its not swapped in any iteration, break the loop
		for(int j = 0; j < words_count - 1;j++){
			subletter = 1;
			if((int) starters[j] == (int) starters[j+1]){
				while(subletter < smallest_word){
					char c1;
					char c2;
					lseek(fd,positions[j],SEEK_SET);
					read(fd,&c1,1);
					lseek(fd,positions[j+1],SEEK_SET);
					read(fd,&c2,1);
					if((int) c1 == (int) c2)subletter++;
					else if((int) c1 > (int) c2){
						swap(j,j+1, positions, starters, sizes);
						swapped = true;
					}
				}
			}
			else if((int) starters[j] > (int) starters[j+1]){\
				swap(j,j+1, positions, starters, sizes);
				swapped = true;
			}
		}
		 if(!swapped) break;
	}
	//AT THIS POINT ARRAYS ARE SORTED, NOW WE REWRITE
	lseek(fd,0,SEEK_SET);
	for(int i = 0; i < chars ;i++)printf("%c",buffer[i]);
	for(int i = 0;i < words_count; i++){
		int index = positions[i];
		for(int j = 0; j <= sizes[i];j++){
			char letter = buffer[positions[i]+j];
			// buffer2[]
			if((int)letter == 0) letter = ' ';
			write(fd,&letter,1);
		}
		}		
	}
