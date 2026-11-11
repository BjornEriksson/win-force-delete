<!-- =========================================================================
     PROJECT:     win-force-delete
     AUTHOR:      BjornEriksson / Björn Eriksson
     LICENSE:     MIT License
     DESCRIPTION: Documentation and deployment guide for the clean Windows 
                  native force deletion batch utility script.
     ========================================================================= -->
# win-force-delete

A minimalist, high-efficiency native Windows Batch script designed to permanently delete files and directories that Windows claims "cannot be found," are locked by system anomalies, or contain invalid/illegal trailing characters (like spaces or dots).

Instead of relying on heavy third-party software installations, this lightweight utility leverages Windows native file system routing engines to bypass path limitations and erase corrupted items instantly.

## The Problem It Solves
Windows frequently misreads files or folders created by automated scripts, cross-platform downloads, or deep file paths (*Long Paths*). When you try to delete them via File Explorer, Windows throws errors stating the item doesn't exist, even though it is visible on your screen. 

`win-force-delete` fixes this by applying a deep file system layout token (`\\?\`) behind the scenes, forcing the kernel to look directly at the raw hardware cluster and execute a permanent wipe.

## Features
* **Zero Dependencies:** Pure native Windows Batch script—no installations required.
* **Smart Detection:** Automatically detects whether the dropped item is an individual file or an entire directory, deploying the correct system command (`del` or `rd`) instantly.
* **Safe Target Queue:** Displays the selected path in a clear confirmation list before firing, preventing accidental wipes.
* **Bypasses Recycle Bin:** Permanently destroys corrupted data configurations to free up frozen file system space.

## Installation

1. Download the `win-force-delete.bat` file into your local environment.
2. Place it anywhere on your computer (e.g., your Desktop).

## How To Use

1. Double-click `win-force-delete.bat` to launch the standard Windows Command Prompt interface.
2. **Drag and drop** the undeletable file or folder directly into the window.
3. Press `ENTER` to queue the item.
4. Review the target path, type `Y` (Yes) to confirm, and press `ENTER` to permanently erase the target.

## Customization
Since this is a standard native script, you can right-click the `.bat` file and open it in Notepad to tweak the operational scope or resize the layout buffer window settings.

## License
MIT License. Feel free to use, modify, and distribute this utility in your own administrative toolkits!
