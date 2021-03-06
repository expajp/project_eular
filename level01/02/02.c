#include <stdio.h>
#define MAX 4000000

int fib_lessthan(int n, int* start);

int main(int argc, char argv[]){
  int answer=0;
  
  int buffer[2] ={1,1};
  int term=0;
  int i=0;
  while(1){
    term=buffer[0]+buffer[1];

    if(term>MAX) break;
    if(term %2==0) answer += term;

    buffer[i%2] = term;
    i++;
  }
  
  printf("%d\n",answer);
  return 0;

}
