# ApkUnpack

Performing static analysis on an Android application can get a bit tedious when having to use apktool and dex2jar to de-compile APK files. I wanted to automate the process in an easy way to assist people with this simple but time consuming task, especially for those who want to de-compile multiple apps using both dex2jar and apktool.

The lightweight ruby gem was built to utilize dex2jar and apktool to de-compile and output the corresponding files to a specified directory.

You can download the latest gem from here:

[Ruby Gem](http://rubygems.org/gems/apk_unpack)

    gem install apk_unpack

You can view the project page on git from here:

[GitHub](https://github.com/nVisium/ruby_apk_unpack)

Dex2jar and apktool are not included within the gem in this version so those two tools will have to be installed separately. The path of apktool.jar, dj2-dex2jar.sh or .bat, the .apk files, and output location is required to be set in a YAML file. The syntax and example of the YAML file is below but can also be found in the /examples directory of the gem:

    apk:
       - /Users/somebody/Desktop/com.example.apk
       - /Users/somebody/Desktop/com.another.example.apk
    apktool: /Users/somebody/tmp/apktool1.5.2/apktool.jar
    output_directory: /Users/somebody/Desktop/apk_stuff
    d2j: /Users/somebody/tmp/dex2jar-0.0.9.15/d2j-dex2jar.sh

To run the gem you execute the following commands:

    apk_unpack -c <path/to/YAML file>

There are a few things we will be working on for future releases. Including the possibility of having the YAML file point at a directory instead of specific APK files, offloading de-compiling the APK files to a service running on Heroku. This would all be automated to download the APK, decompile it and then serve it to the user.

We hope you have found this post to be helpful in performing Android assessments and as usual, we'd love to hear your thoughts.

Special thanks to [Marcus](https://twitter.com/90skicks), [Riandi](https://twitter.com/rwiguna), and [Ken](https://twitter.com/cktricky) for co-authoring the gem.

Abdullah Munawar is an application security consultant at nVisium who specializes in mobile application testing and ripping apart new things. He previously worked on the security teams at financial and aviation organizations, with over 7 years of experience. Abdullah attempts humor on a daily basis and succeeds most of the time, every time. You can follow Abdullah on twitter @amanofwar
