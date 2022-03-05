#Studip Code finally works
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time 
#import pwinput 
import sys 
#import os
import subprocess

#This code can be adapted to any website you routinely visit

#I can not bring myself to delete unusable code like the only directly beneath
#password_studip = pwinput.pwinput(prompt = 'Enter the password of studip ', mask = '*')
#Steals command line argument for username and password
user_value = sys.argv[1] 
password_studip = sys.argv[2] 

web_site='https://studip.uni-passau.de/secure/studip-sp.php?target=https%3A%2F%2Fstudip.uni-passau.de%2Fstudip%2Findex.php%3Fagain%3Dyes%26sso%3Dshib' #input('enter the website: ')

#If the assignment below does not work, you probably should update to the latest or required chrome driver
driver=webdriver.Chrome(executable_path='C:/Program Files/Google/Chrome/Application/chromedriver_win32/chromedriver99.exe')
driver.maximize_window()
driver.get(web_site)

#You certainly do not need this if your internet is real good ;)
time.sleep(5)

#Just some html stuff, code is readable
user_name=driver.find_element_by_name('j_username')
user_name.send_keys(user_value)  
pass_word = driver.find_element_by_name('j_password')
pass_word.send_keys(password_studip)
pass_word.send_keys(Keys.ENTER)

#Below is not really useful unless you want to kill the powershell shell :)
subprocess.run(['powershell', '-Command', "Get-Process | Where-Object { $_.Name -eq 'powershell'} | ForEach-Object {Stop-Process -Id $_.Id}"], capture_output=True)
