# request_monitor
这是一个通过监听网络请求获取发起请求进程的项目

在攻防演练中，攻击者常常使用各种协议的隧道和代理，其中 icmp 这种由于隧道本身所在层不涉及端口，处理过程中，比较难以发现到底是哪个进程在完成隧道搭建，数据传输
这个项目就是来解决这个问题，简单来说就是这个项目中的脚本可以找出当前系统向特定IP发起请求的进程
