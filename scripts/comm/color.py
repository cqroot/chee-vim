#!/usr/bin/env python
# -*- coding: utf-8 -*-


class Color(object):
    @staticmethod
    def fg_red(s):
        return "\033[31m%s\033[0m" % s

    @staticmethod
    def fg_green(s):
        return "\033[32m%s\033[0m" % s

    @staticmethod
    def fg_yellow(s):
        return "\033[33m%s\033[0m" % s

    @staticmethod
    def fg_blue(s):
        return "\033[34m%s\033[0m" % s
