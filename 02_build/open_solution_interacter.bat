set randomNumber=%RANDOM%
set tmp=c:\checkouts\tmp_%randomNumber%
set temp=c:\checkouts\temp_%randomNumber%
"c:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe" ".\build_dflowfm_interacter\dflowfm_interacter.sln"