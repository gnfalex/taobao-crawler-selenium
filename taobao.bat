set "PATH=C:\Users\pc\AppData\Local\Programs\Python\Python310\;%PATH%"
cd /d "%~dp0"
if exist "taobaoCrawler.py" (copy *.bat .. & copy *.ini .. & cd "..")
if not exist "python_venv" (
  python -m venv python_venv
  call python_venv\Scripts\activate.bat
  python -m pip install -r taobao-crawler-selenium\requirements.txt 
) else (call python_venv\Scripts\activate.bat)
if exist "UserData\" (
  rd /q /s "UserData\Default"
  del /q "UserData\*.*"
)
python taobao-crawler-selenium\taobaoCrawler.py 

