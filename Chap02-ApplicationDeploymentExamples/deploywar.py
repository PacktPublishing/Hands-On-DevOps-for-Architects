#!/usr/bin/python
#Bob Aiello - using Python to execute remote commands

import subprocess
import sys

inputPath="./commands.txt"

# We define a function to process the command on the remote machine
def mycmd(COMMAND):
  print(COMMAND)
  
  myNode = "ansctl"
  ssh = subprocess.Popen(["ssh", "%s" % myNode, COMMAND], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

  result = ssh.stdout.readlines()

  if result == []:
    error = ssh.stderr.readlines()
    #print >>sys.stderr, "ERROR: %s" % error
  else:
    print result


# Use a try/catch to handle exceptions for files input/output
try:
    infile = open(inputPath)
except:
    print "We are unable to open the", inputPath," file."
    print "Usage: ./deploywar.py"
    exit() #exit if opening the input file fails


for line in infile: #You may have more than one line in a file
    #print "Input::", line
    mycmd(line);

