# -*- coding: utf-8 -*-
# @Time    : 2017/9/8 下午1:27
# @Author  : Simpson
# @Site    : 
# @File    : manage.py
# @Software: PyCharm
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run()