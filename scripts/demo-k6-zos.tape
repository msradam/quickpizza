Output scripts/k6-zos-demo.gif

Set Shell "bash"
Set FontSize 15
Set Width 1300
Set Height 800
Set Theme "Dracula"
Set TypingSpeed 45ms
Set Framerate 24
Set Padding 20

Hide
Type `export PATH="$PWD/scripts:$PATH"`
Enter
Sleep 200ms
Show

Sleep 500ms

Type `bob run "using the k6 MCP, make a smoke test for ibm-z-mainframe:32208/zosmf, then validate and execute"`
Enter
Sleep 26s

Sleep 4s
