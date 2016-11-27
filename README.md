# Quick Look .bbc4

A Quick Look Plugin to examine the contents of `.bbc4` packages.

## Setting up XCode

Creating a Quick Look project `File > New > Project...` and selecting `Quick Look Plugin`. The resulting project should 


Once done testing and debugging the plugin requires some manual intervention.

[Apple's documentation](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/Quicklook_Programming_Guide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40005020-CH1-SW1) isn't up to date with XCode 8. The following links offer some guidance:

 * [Debugging a Quicklook plugin](http://stackoverflow.com/questions/31049702/debugging-a-quick-look-plugin)
 * [Debugging Quicklook plugin in XCode 4](http://stackoverflow.com/questions/16811547/debugging-quicklook-plugin-in-xcode-4-6)
 * [Creating a Quick Look plugin](http://blog.10to1.be/cocoa/2012/01/27/creating-a-quick-look-plugin/)
 * [OSX Quick Look Plugin development](https://aleksandrov.ws/2014/02/25/osx-quick-look-plugin-development/)

However the build scheme changes detailed failed with the XCode console error `Message from debugger: cannot attach to process due to System Integrity Protection
Program ended with exit code: -1` at run time.

## Tips

Output the generate preview resuts to a directory (`-o`) with `/usr/bin/qlmanage -o /tmp/bbc4 -p ./ql-test.bbc4 -g ./ql-bbc4.qlgenerator -c public.plain-text` (to try `-c uk.co.bbc.bbc4`).

Find out if the `.qlgenerator` is registered use `qlmanage -m plugins | grep bbc`.

Inspect the UTI details associated with files using `mdls your-file.ext`.
