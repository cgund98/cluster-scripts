#!/bin/env python

import sys
import subprocess

# Arg Parser, takes data.big.###.###.json as input to script
files = []
for arg in sys.argv[1:]:
  print(arg)
  arr = arg.split('.')
  filtered = ".".join((arr[2], arr[3]))
  files.append(filtered)

# Born Stuff

def runMigration(param):
  cmd="RTM3D json=%s"%param
  print(cmd)
  return subprocess.call(cmd.split())

   
def createImageParamFile(location):
    filename="mig.%s.P"%location
    f=open(filename,"w")
    f.write("{\n")
    f.write('"data": "data.big.%s.json",\n'%location)
    f.write('"image": "image.%s.json",\n'%location)
    f.write('"velocity": "vel.big.json",\n')
    f.write('"wavelet": "wavelet.json"\n')
    f.write("}\n")
    f.close()
    return filename




def createImageFile(location):
        filename="image.%s.json"%location
        f=open(filename,"w")
        f.write('{\n')
	f.write('"d1" : 12.5,\n')
	f.write('"d2" : 12.5,\n')
	f.write('"d3" : 12.5,\n')
	f.write('"filename" : "image.%s.json.dat",\n'%location)
	f.write('"label1" : "Undefined",\n')
	f.write('"label2" : "Undefined",\n')
	f.write('"label3" : "Undefined",\n')
	f.write('"n1" : 1080,\n')
	f.write('"n2" : 1080,\n')
	f.write('"n3" : 560,\n')
	f.write('"i1" : -3000,\n')
	f.write('"o2" : -3000,\n')
	f.write('"o3" : 0\n')
        f.write('}\n')
        f.close()
        cmd="cp image.big.json.dat image.%s.json.dat"%location
        print cmd
        return  subprocess.call(cmd.split())

   
    
def migrate(location):
   """Function to migrate a single experiment
        Embarassingly parallel"""
   if 0!= createImageFile(location):
      print "trouble copyimage image file %s"%location
      sys.exit(-1)
   imageParam=createImageParamFile(location)
   if  0!= runMigration(imageParam):
      print "trouble running migraiton at %s\n"%location
      sys.exit(-1)


def runAdd(param):
  x="Add"
  cmd="%s json=%s"%(x,param)
  print cmd
  return subprocess.call(cmd.split())

def createAddFile(loc1,loc2,out):
    filename="add.P"
    f=open(filename,"w")
    f.write("{\n")
    f.write('"in1": "image.%s.json",\n'%loc1)
    f.write('"in2": "image.%s.json",\n'%loc2)
    f.write('"out": "%s"\n'%out)
    f.write("}\n")
    f.close()
    return filename


def add(loc1,loc2,out):
   """Function to add migrated images"""
   addParam=createAddFile(loc1,loc2,out) 
   if 0!= runAdd(addParam): 
     print "trouble running add with files %s and %s \m"%(loc1,loc2)
     sys.exit(-1)

for f in files:
   print('migrating: ' + f)
   migrate(f)
   print('Done migrating: '+ f)

#migrate("1000.2000")
#migrate("2400.1000")
#add("1000.2000","2400.1000","out.json")




