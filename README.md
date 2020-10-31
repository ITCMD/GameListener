# GameListener
 This tool listens for games and closes / opens programs you set. For example, whenever I run any games I have it close onedrive, rainmeter, and wallpaperengine. It then launches them again once the game is closed.



## Setup

1. Place `GameListener.bat` and the `Bin` folder where you would like it to be permanently.

2. Open a command prompt and run `GameListener -s`. This will create a vbs script for you to put in your `shell:startup` folder (assuming you would like to run it on startup). To access the folder type `shell:startup` in Run or Windows Explorer.

3. List your games in `Bin\listen.txt` (new line for each exe)

   *For example, `ModernWarfare.exe`. If you're not sure the exe name, check in task manager.*

4. List what tasks you want to close on game launch in `Bin\kill.txt`

   *For example: `onedrive.exe`. If you're not sure the exe name, check in task manager.*

5. List the paths to files you want to run in `Bin\launch.txt`
   *For example: `"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Rainmeter.lnk"`. If you're not sure where it is, find it in the start menu, right click, and select "Open File Location".*

6. If you want to kill or launch tasks for specific games, create text files in `Bin\KillOnGame\` and `Bin\StartOnGame\` respectively, with the name of the program.
   *For example: `ModernWarfare.exe.txt`.*

7. You're done! You'll have to restart your pc or run the vbs startup file in order to start using GameListener. You can edit any of the files while it runs to add and remove games, kill tasks, and start tasks!

## Tips

- You cannot use parameters in the `start.txt` file. 
- If you need to include parameters, create a shortcut by right-clicking in a folder, `New -> Shortcut` and enter the path to the program in double quotes with parameters after it.
  For example, I needed to run onedrive with `"C:\Users\ldell\AppData\Local\Microsoft\OneDrive\OneDrive.exe" /background`. I created a shortcut with that exact line as its target, and linked to the shortcut file in GameListener.
- You can change the refresh speeds for non-game-mode and game mode on lines `20` and `65` respectively.
- You can easily check if GameListener is in game mode with [CMDS](https://github.com/ITCMD/CMDS) via the window title. If GameListener is in game mode, you'll see ` Game Listener for Killing Programs [Game]`. Otherwise, you'll see ` Game Listener for Killing Programs [No Game]`.



