#!/usr/bin/env python
import os
import io
import sys
files = sys.argv
values = []
for filee in files[1:]:
  filename = filee
  file = open(filename, "r")
  content =  file.read()
  words = content.split()
  i = 0
  while (i < len(words)):
    if((words[i])[0] == "r"):
      rawTime = words[i+1]
      splitTime = rawTime.split("m")
      mins = int(splitTime[0])
      seconds = float(splitTime[1].split("s")[0])
      seconds += mins * 60
      print filename.split(".")[0] + ": " + str(seconds) 
    i += 1
  file.close()
