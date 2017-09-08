# -*- coding: utf-8 -*-
# @Time    : 2017/9/8 下午1:27
# @Author  : Simpson
# @Site    : 
# @File    : manage.py
# @Software: PyCharm
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello World!"

if __name__ == '__main__':
    app.run()