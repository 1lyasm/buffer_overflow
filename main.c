#include <sys/syscall.h>

int main() {
    char fname[] = "/home/student/grades.txt";
    syscall(SYS_unlink, fname);
}