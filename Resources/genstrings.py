import fnmatch
import os
import sys
from xml.dom import minidom

function = sys.argv[1]
rootdir  = sys.argv[2]

# Generate strings from .m files

files = []
for root, dirnames, filenames in os.walk(rootdir):
  for filename in fnmatch.filter(filenames, '*.m'):
      files.append(os.path.join(root, filename))

strings = []
for file in files:
    lineNumber = 0
    for line in open(file):
        lineNumber += 1
        index = line.find(function)
        if (index != -1):
            callStr = line[index:]
            index = callStr.find('@')
            if (index == -1):
                print 'call with a variable/macro. file: ' + file + ' line: %d' % lineNumber
            else:
                callStr = callStr[index+1:]
                index = callStr.find('")')
                callStr = callStr[:index+1]
                if callStr not in strings:
                    strings.append(callStr) 

# Write strings to file

f = open('Localizable.strings', 'w+')           
for string in strings:
    f.write(string + ' = ' + string + ';\n\n')
f.close()