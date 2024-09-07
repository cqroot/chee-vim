#!/usr/bin/env python
# -*- coding: utf-8 -*-


class Color(object):
    @staticmethod
    def fg_black(s):
        return "\033[30m%s\033[0m" % s

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

    @staticmethod
    def fg_magenta(s):
        return "\033[35m%s\033[0m" % s

    @staticmethod
    def fg_cyan(s):
        return "\033[36m%s\033[0m" % s

    @staticmethod
    def fg_white(s):
        return "\033[37m%s\033[0m" % s

    @staticmethod
    def bg_black(s):
        return "\033[40m%s\033[0m" % s

    @staticmethod
    def bg_red(s):
        return "\033[41m%s\033[0m" % s

    @staticmethod
    def bg_green(s):
        return "\033[42m%s\033[0m" % s

    @staticmethod
    def bg_yellow(s):
        return "\033[43m%s\033[0m" % s

    @staticmethod
    def bg_blue(s):
        return "\033[44m%s\033[0m" % s

    @staticmethod
    def bg_magenta(s):
        return "\033[45m%s\033[0m" % s

    @staticmethod
    def bg_cyan(s):
        return "\033[46m%s\033[0m" % s

    @staticmethod
    def bg_white(s):
        return "\033[47m%s\033[0m" % s
