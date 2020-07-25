## configurate NDK
+ sudo gedit /etc/profile
edit and add content
```
export NDK=/home/shuyun/dev/android-ndk-r14b
export PATH=$NDK:$PATH
```
+ source /etc/profile
+ ndk-build --version
