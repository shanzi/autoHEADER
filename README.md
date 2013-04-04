<!--********************************************************************************
*     File Name           :     README.md
*     Created By          :     shanzi
*     Creation Date       :     [2012-10-04 01:10]
*     Last Modified       :     [2013-04-05 00:48]
*     Description         :     Introduction to autoHEADER
*********************************************************************************-->


# autoHEADER 

## Introduction

autoHEADER is a vim helper plugin for easier inserting comment header block contains varies of infomation.
For example, a typical python comment header block may like this:


    #! /usr/bin/env python
    #################################################################################
    #     File Name           :     test.py
    #     Created By          :     shanzi
    #     Creation Date       :     [2012-10-04 01:15]
    #     Last Modified       :     [AUTO_UPDATE_BEFORE_SAVE]
    #     Description         :     
    #################################################################################

## Install

To install you can just clone or download the source code and extract into your `.vim` folder. 
But the recommended way to install autoHEADER is through [vundle](https://github.com/gmarik/vundle).
Just add the following line into your `.vimrc` :

    Bundle 'shanzi/autoHEADER'     "autoHEADER

And then run command `:BundleInstall`

## Usage

autoHEADER is able to insert comment block at the head of you source file automatically when you are creating
a new file with `vim newfile.py` in console , or `:e new.vim` in vim. 

You can also invoke the function by hand with command `:AutoHeader`

By default autoHEADER enables itself the moment vim launches, you can cancel this by adding
`let g:autoHEADER_auto_enable=0` to your `.vimrc` file.

To enable or disable autoHEADER by hand , use `:AutoHeaderEnable` and `:AutoHeaderDisable` .

## Config

1. `g:autoHEADER_auto_enable`
    Decide whether autoHEADER will be auto loaded when vim launches, default is 1.
2. `g:autoHEADER_default_author`
    The default author name displayed follows _Creation By_ , the default value is
    your $USER environment varible.
3. `g:autoHEADER_fill_char_repeat`
    Repeat of chars on top and at bottom of the comment block.
    The default value is 80.


## Licence

    autoHEADER - a vim plugin auto insert comment header blocks

    Copyright (C) 2012 shanzi
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY sh ''AS IS'' AND ANY
    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL sh BE LIABLE FOR ANY
    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


    The views and conclusions contained in the software and documentation 
    are those of the authors and should not be interpreted as representing
    official policies, either expressedor implied, of sh.


