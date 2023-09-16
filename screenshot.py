"""Make screenshots of slides

Given paths, makes a .png
"""

PAGE_SIZE = { 'width': 1920, 'height': 1080 }

import os
import sys
from pathlib import Path

import playwright
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.firefox.launch()
    page = browser.new_page()
    page.set_viewport_size(PAGE_SIZE)
    for path in sys.argv[1:]:
        page.goto('file://'+str(Path.cwd()/path))
        print(path, page.title())
        page.screenshot(path=os.path.splitext(path)[0]+'.png')

    browser.close()
