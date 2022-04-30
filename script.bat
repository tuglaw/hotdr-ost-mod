@echo off

echo.
echo  :: Original Soundtrack Mod for THE HOUSE OF THE DEAD: Remake by tuglaw ::
echo.
echo     https://github.com/tuglaw/hotdr-ost-mod
echo.
echo.
echo     This script will convert and rename your original soundtrack files for use with Fmod Bank Tools.
echo.
echo     Make sure you already used Fmod Bank Tools to "Extract" the Remake's ".bank" files.
echo.
echo     Please refer to the "README" file for instructions.
echo.
echo.
echo  :: Do you want to start the script? [Y]es / [N]o
echo.
choice /C "YN" /N
set x=%errorlevel%
if %x% == 1 goto start
if %x% == 2 goto exit

:start
	::Detect if 'original' folder exists and if there's at least 1 file with '0' in its name
	for %%i IN (.\original\*0*.*) do (
		goto backup
	)
		echo.
		echo  ================================================================================
		echo.
		echo.
		echo   ! ERROR: Please make sure the 'original' folder exists and it contains
		echo     the original soundtrack files, correctly numbered from 02 to 12.
		echo.
		echo  :: Press any key to exit . . .
		pause > nul
		goto exit

:backup
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Creating a backup of the original ".bank" files . . .
	echo.
	for %%i IN (.\bank\*.*) do (
		for %%i IN (.\bank-backup\*.*) do (
			echo.
			echo  :: Folder "bank-backup" isn't empty, continuing without performing backup . . .
			goto process
		)
			echo d | xcopy bank bank-backup
			echo.
			echo  :: Creating a backup of the original ".bank" files . . . Done
			goto process
	)
		echo   ! ERROR: Folder "bank" is empty, aborting script . . .
		echo.
		echo.
		echo     Please follow the instructions in the "README" file.
		echo.
		echo.
		echo  :: Press any key to exit . . .
		pause > nul
		goto exit

:process
	::Check if files in 'original' folder are WAV or not
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	if exist ".\original\*.wav" (
		echo  :: Script found WAV files.
		goto trimprompt
	) else (
		echo  :: Script found non-WAV files
		echo.
		echo.
		echo     The script can attempt to convert the audio files into WAV format.
		echo     Make sure they are audio files.
		echo.    This script was only tested with MP3, FLAC and OGG files.
		echo.
		echo.
		echo  :: Try to convert your non-WAV audio files? [Y]es / [N]o
		echo.
		goto notwav
	)

:notwav
	choice /C "YN" /N
	set x=%errorlevel%
	if %x% == 1 goto convertyes
	if %x% == 2 goto convertno

:convertno
	echo.
	echo.
	echo  :: Please provide compatible audio files and run the script again.
	goto prompt

:convertyes
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Converting non-WAV files into WAV . . .
	echo.
	for %%A IN (.\original\*0*.*) DO .\script\ffmpeg -y -loglevel fatal -i "%%~A" ".\original\%%~nA.wav"
	for %%A IN (.\original\*11*.*) DO .\script\ffmpeg -y -loglevel fatal -i "%%~A" ".\original\%%~nA.wav"
	::for %%A IN (.\original\*12*.*) DO .\script\ffmpeg -y -loglevel fatal -i "%%~A" ".\original\%%~nA.wav"
	echo.
	echo  :: Converting non-WAV files into WAV . . . Done
	echo.
	echo.
	echo  ================================================================================
	goto trimprompt

:trimprompt
	echo.
	echo.
	echo  :: Audio Trimming
	echo.
	echo.
	echo     When extracted from the CD, all audio tracks after Track 02 begin with 2 seconds of silence.
	echo.
	echo     This is more noticeable in-game with the "Chapted Clear" track, which cuts too soon.
	echo.
	echo     If that's the case with your copy of the soundtrack, the script can trim these 2 seconds off.
	echo.
	echo.
	echo  :: Trim the audio files? [Y]es / [N]o
	choice /C "YN" /N
	set x=%errorlevel%
	if %x% == 1 goto trimming
	if %x% == 2 goto wav
	
:trimming
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Trimming audio files . . .
	echo.
	if not exist ".\original\temp\" mkdir .\original\temp
	for /F "usebackq tokens=*" %%A IN (`dir /S /B .\original\*.wav ^| find /v "02"`) DO .\script\ffmpeg -y -loglevel fatal -i "%%~A" -ss 2 ".\original\temp\%%~nA.wav"
	for %%A IN (.\original\temp\*.wav) DO xcopy /y "%%~A" ".\original\%%~nA.wav"*
	if exist ".\original\temp\" rmdir /Q /S .\original\temp
	echo.
	echo  :: Trimming audio files . . . Done
	goto wav

:wav
	::Copy and rename files, replacing the remake files
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Copying empty.wav and modified file lists to prevent bug that breaks the last sound file . . .
	echo.
	xcopy /Y ".\script\empty.wav" ".\wav\LVL1\empty.wav"*
	xcopy /Y ".\script\empty.wav" ".\wav\LVL2\empty.wav"*
	xcopy /Y ".\script\empty.wav" ".\wav\LVL3\empty.wav"*
	xcopy /Y ".\script\empty.wav" ".\wav\LVL4\empty.wav"*
	xcopy /Y ".\script\empty.wav" ".\wav\MainMenu\empty.wav"*
	xcopy /Y ".\script\empty.wav" ".\wav\Master\empty.wav"*

	xcopy /Y ".\script\LVL1.txt" ".\wav\LVL1\LVL1.txt"*
	xcopy /Y ".\script\LVL2.txt" ".\wav\LVL2\LVL2.txt"*
	xcopy /Y ".\script\LVL3.txt" ".\wav\LVL3\LVL3.txt"*
	xcopy /Y ".\script\LVL4.txt" ".\wav\LVL4\LVL4.txt"*
	xcopy /Y ".\script\MainMenu.txt" ".\wav\MainMenu\MainMenu.txt"*
	xcopy /Y ".\script\Master.txt" ".\wav\Master\Master.txt"*
	
	echo.
	echo  :: Copying empty.wav and modified file lists . . . Done
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Copying soundtrack files to their respective folders . . .
	echo.

	::LVL1
	xcopy /Y ".\original\*03*.wav" ".\wav\LVL1\Chapter 1-loop.wav"*
	xcopy /Y ".\original\*07*.wav" ".\wav\LVL1\THOTD-Boss Theme-loop.wav"*

	::LVL2
	xcopy /Y ".\original\*04*.wav" ".\wav\LVL2\Chapter 2-loop.wav"*
	xcopy /Y ".\original\*07*.wav" ".\wav\LVL2\THOTD-Boss Theme-loop.wav"*

	::LVL3
	xcopy /Y ".\original\*05*.wav" ".\wav\LVL3\chapter3-loop.wav"*
	xcopy /Y ".\original\*07*.wav" ".\wav\LVL3\THOTD-Boss Theme-loop.wav"*

	::LVL4
	xcopy /Y ".\original\*06*.wav" ".\wav\LVL4\chapter 4-loop.wav"*
	xcopy /Y ".\original\*08*.wav" ".\wav\LVL4\Magician_s Theme-loop.wav"*
	xcopy /Y ".\original\*02*.wav" ".\wav\LVL4\THOTD - introduction-loop.wav"*

	::MainMenu
	xcopy /Y ".\original\*06*.wav" ".\wav\MainMenu\Title-screen-loop.wav"*
	xcopy /Y ".\original\*02*.wav" ".\wav\MainMenu\THOTD - introduction-loop.wav"*

	::Master
	xcopy /Y ".\original\*09*.wav" ".\wav\Master\music_chapterClear.wav"*
	xcopy /Y ".\original\*10*.wav" ".\wav\Master\music_gameOver.wav"*
	xcopy /Y ".\original\*11*.wav" ".\wav\Master\credits-loop.wav"*
	
	echo.
	echo  :: Copying soundtrack files to their respective folders . . . Done
	goto end

:end
	echo.
	echo.
	echo  ================================================================================
	echo.
	echo.
	echo  :: Original Soundtrack Mod for THE HOUSE OF THE DEAD: Remake by tuglaw :: Completed!
	echo.
	echo.
	echo     The Remake's original ".bank" files should be safely backed up in the "bank-backup" folder.
	echo.
	echo     You can now return to Fmod Bank Tools and press "Rebuild".
	echo.
	echo     Once that process is complete, copy the modified ".bank" files from the "bank" folder
	echo     in Fmod Bank Tools, and replace the ones in the Remake's "StreamingAssets" folder.
	goto prompt

:prompt
	echo.
	echo.
	echo     The script will now exit.
	echo.
	echo  :: Press any key to exit . . .
	pause > nul
	exit
	
:exit
	exit