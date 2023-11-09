
@echo off
For /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)

SET backupdir=C:\backupsgoya
SET mysqluername=root
SET database=dbgoya

C:\xampp\mysql\bin\mysqldump.exe -uroot %database% > %backupdir%\%database%_%mydate%_%mytime%_.sql
