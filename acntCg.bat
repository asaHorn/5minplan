@echo off
net user %1 %3
wmic useraccount where name='%1' rename %2
