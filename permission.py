#!/usr/bin/env python  
# -*- coding: utf-8 -*-  

import os
import re

files = []

def SearchFile(path, keyword): 
    for fileName in os.listdir(path):
        fp = os.path.join(path, fileName)
        if os.path.isfile(fp) and keyword in fileName:
            files.append(fp)
        elif os.path.isdir(fp):
            search(fp, keyword)


def main():
    SearchFile(".", "xml")
    target = open("permission.txt", "w")
    for file in files:
        fp = open(file, "r")
        context = fp.read();
        fp.close()
        pattern = re.compile('android\.permission\..*"')
        results = pattern.findall(context)
        for result in results:
            line = result[0:len(result)-2] + "\n"
            target.write(line)
    target.close()
         

if __name__ == "__main__":
    main()