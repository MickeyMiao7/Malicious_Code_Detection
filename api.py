#!/usr/bin/env python  
# -*- coding: utf-8 -*-  

import os
import re

files = []
maliciousAPI = ["barcodescanner.SCAN" 
                ]

def SearchFile(path, keyword): 
    for fileName in os.listdir(path):
        fp = os.path.join(path, fileName)
        if os.path.isfile(fp) and keyword in fileName:
            files.append(fp)
        elif os.path.isdir(fp):
            SearchFile(fp, keyword)


def main():
    SearchFile(".", "smali")
    target = open("api.txt", "w")
    for file in files:
        fp = open(file, "r")
        context = fp.read();   
        fp.close()
        for api in maliciousAPI:
            pattern = re.compile(api)
            results = pattern.findall(context)
            for result in results:
                line = "URL: " + file + "\r\n"
                target.write(line)
                line = "MaliciousAPI: " + result + "\r\n"
                target.write(line)
                target.write("\r\n")
    target.close()
         

if __name__ == "__main__":
    main()