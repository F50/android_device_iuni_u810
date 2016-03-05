import common
import edify_generator
import os
import re
import time
import copy

def RemoveDeviceAssert(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "ro.product" in edify.script[i]:
          edify.script[i] = '''ui_print("****************************");
ui_print("*          IUNI U2         *");
ui_print("*          MIUI  V7        *");
ui_print("*         ''' + time.strftime('%Y-%m-%d',time.localtime(time.time())) + '''       *");
ui_print("*    Powered by Heavenke   *");
ui_print("****************************");'''
  return

def RemoveDeviceGetprop(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "getprop" in edify.script[i]:
      edify.script[i] = ''
      return

def FullOTA_PostValidate(info):
    RemoveDeviceAssert(info)
    RemoveDeviceGetprop(info)
