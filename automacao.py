import pyautogui
import time

print("Você tem 3 segundos para focar a janela do AnyDesk...")
time.sleep(3)

pyautogui.moveTo(200, 150, duration=1)
pyautogui.click()

pyautogui.write("Ola, estou automatizando!")
pyautogui.press("enter")