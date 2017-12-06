
powercfg -h off
bcdedit /set recoveryenabled no
fsutil behavior set DisableLastAccess 1
fsutil behavior set Disable8dot3 1
powercfg -change -disk-timeout-ac 0
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
C:\Windows\Microsoft.NET\Framework64\v4.0.30.319\ngen update
C:\Windows\Microsoft.NET\Framework64\v4.0.30.319\ngen eqi 3

gpupdate /force

cd %ProgramFiles(x86)%\Norskale\Norskale Agent Host
AgentCacheUtility -refreshcache -debug
