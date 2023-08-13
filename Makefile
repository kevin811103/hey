binary = hey

release:
	GOOS=windows GOARCH=amd64 go build -o ./bin/hey.exe
	GOOS=linux GOARCH=amd64 go build -o ./bin/$(binary)_linux_amd64
	GOOS=darwin GOARCH=amd64 go build -o ./bin/$(binary)_darwin_amd64


window release

```
set GOOS=windows
set GOARCH=amd64

go build -o ./bin/hey.exe

# 如何使用 
打包完後將你bin 資料夾 放到windows path 環境變數 重開cmd  輸入hey 應該就行了