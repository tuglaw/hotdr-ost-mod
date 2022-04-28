# Original Soundtrack Mod for THE HOUSE OF THE DEAD: Remake

![Mod Logo](https://repository-images.githubusercontent.com/486545456/79e81dfc-6c06-458a-9bb2-f6a4046dacad "Mod Logo.")<br>

<br>

## Description

This is a script that helps with replacing the Remake's soundtrack with the original one.

To modify the game's files, you'll need the following:
- This script
- Fmod Bank Tools (version 0.0.1.4 should work)
- A copy of the original soundtrack

<br>

### Script

The script renames the original soundtrack files and copies them into their respective folders.

It also attempts to convert your audio files into ".wav" files, and adds an additional "empty.wav" file in an attempt to fix a bug where Fmod Bank Tools would corrupt the last audio file on each ".bank".

***Download the script here:*** https://github.com/tuglaw/hotdr-ost-mod/releases/latest

<br>

### Fmod Bank Tools

Fmod Bank Tools is used to extract the Remake's ".bank" files and then to rebuild them with the modified soundtrack.

If you get the error "FSBExtract.dll DLL Not Found" when trying to run the tool, you must download and install [Microsoft Visual C++ 2017 Redistributable x86](https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022).

***Download Fmod Bank Tools here:*** https://www.nexusmods.com/rugbyleaguelive3/mods/2?tab=files

<br>

### Original Soundtrack

You must provide your copy of the original soundtrack, either from the Saturn version or PC version.

<br>

## Instructions

1. Download and extract the ***Fmod Bank Tools*** to anywhere you want.

<br>

2. Download and extract the contents of the ***hotdr-ost-mod-v1.0.0.zip file*** into the ***Fmod Bank Tools folder***.

    It should all look like this:<br>
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/1.png "Fmod Bank Tools folder with script contents extracted.")<br>

    <br>

3. Copy your ***original soundtrack files*** into the ***"original" folder***.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/2.png "\"original\" folder with \".wav\" audio files.")<br>
    
    <br>

    The soundtrack doesn't need to be named exactly as in this screenshot.
    As long as their filenames contain the numbers "02" to "12" and are correctly ordered without any duplicates, the script will detect them.

    If your soundtrack files aren't in ".wav" format, the script will use ffmpeg to try and convert them.
    Make sure they are audio files, this script was only tested with MP3, FLAC and OGG files.

    <br>

4. Go into the Remake's ***"StreamingAssets" folder*** and copy the following ***".bank" files*** into the Fmod Bank Tools ***"bank" folder***:

    - LVL1.bank
    - LVL2.bank
    - LVL3.bank
    - LVL4.bank
    - MainMenu.bank
    - Master.bank

    DO NOT COPY THE FILE "Master.strings.bank"! It's not necessary and it will break.
    
    <br>
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/3.png "\"bank\" folder with the game's \"*.bank\" files.")<br>

    <br>

5. Run Fmod Bank Tools and press the Extract button.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/4.png "The Fmod Bank Tools program with the Extract button highlighted.")<br>
    
    <br>

    The progress bar fills up to 100% for each ".bank" file. It will take a while.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/5.png "The Fmod Bank Tools program extracting the \"*.bank\" files.")<br>
    
    <br>

     Once it's done extracting, click OK but don't close the program.
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/6.png "The Fmod Bank Tools program with the extraction process completed.")<br>

    <br>

6. Once the extraction is complete, leave Fmod Bank Tools open and run the script.bat.

    If you get any file copying errors, you might need to use "Run as Administrator".

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/7.png "Command Prompt window with script running.")<br>
    
    <br>

    If your soundtrack files aren't in ".wav" format, the script will use ffmpeg to try and convert them.
    Make sure they are audio files, this script was only tested with MP3, FLAC and OGG files.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/8.png "Script prompting to convert audio files to WAV.")<br>
    
    <br>

    Once the script concludes without errors, go back to Fmod Bank Tools.
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/9.png "Script has finished running.")<br>

    <br>

7. Return to the Fmod Bank Tools and press the Rebuild button.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/10.png "The Fmod Bank Tools program with the Rebuild button highlighted.")<br>
    
    <br>

    It will open a command window like this for each of the ".bank" files. It will probably take less time than the extraction process.

    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/11.png "The Fmod Bank Tools program rebuilding the \"*.bank\" files.")<br>
    
    <br>

    Once the rebuilding process is complete, you can now close the program.
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/12.png "The Fmod Bank Tools program with the rebuilding process completed.")<br>
    
    <br>

    You'll find your modified ".bank" files inside Fmod Bank Tools' "bank" folder.
    
    ![Mod Logo](https://github.com/tuglaw/hotdr-ost-mod/blob/main/images/13.png "\"bank\" folder with the now modified game's \"*.bank\" files.")<br>

    <br>

8. Copy the modified ".bank" files into the Remake's "StreamingAssets" folder, replacing the original ones.

    <br>
    
---

And that's it, enjoy listening to the original soundtrack in THE HOUSE OF THE DEAD: Remake!
