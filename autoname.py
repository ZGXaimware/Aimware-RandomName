from flask import Flask
import keyboard
import time
import threading
import win32gui, win32con
import re, traceback

app = Flask(__name__)

class cWindow:
    def __init__(self):
        self._hwnd = None
    def SetAsForegroundWindow(self):
        # First, make sure all (other) always-on-top windows are hidden.
        self.hide_always_on_top_windows()
        win32gui.SetForegroundWindow(self._hwnd)
    # def Maximize(self):
    #     win32gui.ShowWindow(self._hwnd, win32con.SW_MAXIMIZE)
    def _window_enum_callback(self, hwnd, regex):
        '''Pass to win32gui.EnumWindows() to check all open windows'''
        if self._hwnd is None and re.match(regex, str(win32gui.GetWindowText(hwnd))) is not None:
            self._hwnd = hwnd
    def find_window_regex(self, regex):
        self._hwnd = None
        win32gui.EnumWindows(self._window_enum_callback, regex)
    def hide_always_on_top_windows(self):
        win32gui.EnumWindows(self._window_enum_callback_hide, None)
    def _window_enum_callback_hide(self, hwnd, unused):
        if hwnd != self._hwnd: # ignore self
            # Is the window visible and marked as an always-on-top (topmost) window?
            if win32gui.IsWindowVisible(hwnd) and win32gui.GetWindowLong(hwnd, win32con.GWL_EXSTYLE) & win32con.WS_EX_TOPMOST:
                # Ignore windows of class 'Button' (the Start button overlay) and
                # 'Shell_TrayWnd' (the Task Bar).
                className = win32gui.GetClassName(hwnd)
                if not (className == 'Button' or className == 'Shell_TrayWnd'):
                    # Force-minimize the window.
                    # Fortunately, this seems to work even with windows that
                    # have no Minimize button.
                    # Note that if we tried to hide the window with SW_HIDE,
                    # it would disappear from the Task Bar as well.
                    win32gui.ShowWindow(hwnd, win32con.SW_FORCEMINIMIZE)

def setpopwindow():
    try:
        regex = ".*Counter-Strike*"
        cW = cWindow()
        cW.find_window_regex(regex)
        # cW.Maximize()
        cW.SetAsForegroundWindow()
    except Exception as e:
        print(e)

def hold_key():
    setpopwindow()
    keyboard.press('page down')
    time.sleep(0.2)
    keyboard.release('page down')

@app.route('/', methods=['GET'])
def press_and_release_key():
    t = threading.Thread(target=hold_key)
    t.start()
    return '!'

if __name__ == '__main__':
    app.run("127.0.0.69")
