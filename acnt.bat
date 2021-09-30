@echo off
net user %1 %3
if not %2=="nc" wmic useraccount where name='%1' rename %2
