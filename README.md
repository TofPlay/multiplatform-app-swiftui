![Multiplatform SwiftUI](https://user-images.githubusercontent.com/1082222/91602064-fbe33c80-e96a-11ea-9d74-9ddff98aa02a.jpg)

# What is "Multiplatform App SwiftUI"?

This is a new type of project that can be created with **Xcode 12**. <br>
Theoretically with SwiftUI we should be able to create a single project for all platforms (from watchOS to macOS). In theory, we should be able to use the same SwiftUI code regardless of the platform. <br>
In practice, the size of the screens can be very different between, for example, an Apple Watch and a Mac. In this case, to take advantage of each screens, we will have to make a specific design (and a specific code) for each platforms.<br>
The only case where we can hope to have the same code is between an iPadOS application and macOS application.<br>
Now the question is: Do the components of SwiftUI work the same on both platforms?<br>
This is what I have tried to determine with this **test project** (without specific architecture or elaborate design). In this test project we have a Sidebar with a list the SwiftUI components and for each of them I made a screen that uses them in different configurations. I even started a section for third party components. At the end of each test there is a "Test Result" section which reminds us the environment and which lists the points which have been tested, indicating whether they have passed or not.<br>
This project was done with **Xcode 12.2 Beta** on **macOS Big Sur Beta 8**. So to run this project you must be on macOS Big Sur Beta 8 with Xcode 12.2 Beta.<br>
These are beta versions the test results will probably be different with the final version.

