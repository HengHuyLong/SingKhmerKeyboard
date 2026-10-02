[Setup]
AppName=SingKhmerKeyboard
AppVersion=0.1
AppPublisher=HengHuyLong
DefaultDirName={autopf}\SingKhmerKeyboard
DefaultGroupName=SingKhmerKeyboard
OutputBaseFilename=SingKhmerKeyboard-Windows-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
; Place the Weasel installer in this folder and rename it to weasel-installer.exe before compiling!
Source: "weasel-installer.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall ignoreversion

; Our Rime configuration files
Source: "..\xingkhmer.dict.yaml"; DestDir: "{userappdata}\Rime"; Flags: ignoreversion
Source: "..\xingkhmer.schema.yaml"; DestDir: "{userappdata}\Rime"; Flags: ignoreversion
Source: "..\default.custom.yaml"; DestDir: "{userappdata}\Rime"; Flags: ignoreversion
Source: "..\weasel.custom.yaml"; DestDir: "{userappdata}\Rime"; Flags: ignoreversion

[Run]
; Install Weasel silently in the background
Filename: "{tmp}\weasel-installer.exe"; Parameters: "/S"; StatusMsg: "Installing Rime Engine (Weasel)..."; Flags: waituntilterminated

; Automatically deploy the new dictionary and schema
Filename: "{pf}\Rime\weasel-0.17.4\WeaselDeployer.exe"; Parameters: "/deploy"; StatusMsg: "Configuring SingKhmer Keyboard..."; Flags: runhidden skipifdoesntexist
Filename: "{pf32}\Rime\weasel-0.17.4\WeaselDeployer.exe"; Parameters: "/deploy"; StatusMsg: "Configuring SingKhmer Keyboard..."; Flags: runhidden skipifdoesntexist

[Messages]
FinishedHeadingLabel=SingKhmerKeyboard is installed!
FinishedLabel=Setup has finished installing SingKhmerKeyboard on your computer. %n%nTo start typing in Khmer:%n1. Press Windows Key + Space to switch to the Weasel input method.%n2. Start typing romanized Khmer!
