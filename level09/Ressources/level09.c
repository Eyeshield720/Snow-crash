#include <unistd.h>
#include <fcntl.h>
int main(int ac, char **av){
    char c[1];
    int cnt = 0;
    int fd, out;
    if ((fd = open(av[1],O_RDONLY)) < 0)
        write(2, "ERROR OPEN\n", 12);
    if ((out = open(av[2], O_WRONLY | O_CREAT, 0777)) < 0)
        write(2, "ERROR CREAT\n", 13);
    while (read(fd, c, 1) > 0){
        if (*c != '\x0a')
        {
            *c = *c - cnt; 
        }
        write(out, c, 1);
        cnt++;
    }
    return 0;
}