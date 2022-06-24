# 100 Days Of Code - Log

## Day 0: 21 May 2022

**Today's Progress**: Started [the official SwiftUI tutorial](https://developer.apple.com/tutorials/swiftui).

**Thoughts**: Very impressed with user friendly features of XCode.

**Link to work**: [Landmarks](./Landmarks/)

## Day 1: 22 May 2022

**Today's Progress**: `View` components, Swift modifiers, how to bind data and state

**Thoughts**: View component statements look similar to other frontend frameworks like ReactJS. Closure looks like Lambda in Java or Python. EnvironmentObject sounds very new to me.

**Link to work**: [Landmarks](./Landmarks/)

## Day 2: 23 May 2022

**Today's Progress**: How to draw shapes with `CGPoint` and customize animation effects.

**Thoughts**: Drawing with CGPoints seems like drawing SVG. The animation effect customization is powerful to fine tune given animations. The tutorial's hint to pin the main view while adjusting animations in sub-view is useful.

**Link to work**: [Landmarks](./Landmarks/)

## Day 3: 24 May 2022

**Today's Progress**: `TabView`, `ScrollView`, `NavigationView`, `NavigationLink`, `EditButton`, `@Environment`

**Thoughts**: Modifier is a powerful tool in Swift. A developer should understand deeply SwiftUI components such as EditButton. They can perform specific functions themselves and developers do not need to implement the functions on top.

**Link to work**: [Landmarks](./Landmarks/)

## Day 4: 25 May 2022

**Today's Progress**: Integration of SwiftUI and UIKit via `UIViewControllerRepresentable`

**Thoughts**: UIKit is a more mature framework in iOS and has been widely used for long. Pleased to know how to make SwiftUI and UIKit work together.

**Link to work**: [Landmarks](./Landmarks/)

## Day 5: 26 May 2022

**Today's Progress**: Started [100 Days of SwiftUI in Hacking With Swift](https://www.hackingwithswift.com/100/swiftui)

**Thoughts**: I revised data types: Int, Double, String, Bool, Array, Dictionary and Set. They are similar to those in other languages such as Python. They are also improved, e.g. default in Dictionary, to help in common scenarios.

**Link to work**: N/A

## Day 6: 27 May 2022

**Today's Progress**: type annotation, if, switch, ternary, for, while, function and error

**Thoughts**: Although most features are similar to other languages, Swift has its unique syntax and handling.

**Link to work**: N/A

## Day 7: 28 May 2022

**Today's Progress**: function, closure and struct

**Thoughts**: Closure is one of powerful tools in Swift, similar to callback in JS or lambda in Python but has more features.

**Link to work**: N/A

## Day 8: 30 May 2022

**Today's Progress**: class, protocol and optional

**Thoughts**: Class and Optional exist in Java. Protocol is similar to Interface. A lot of syntax improve efficiency and readability.

**Link to work**: N/A

## Day 9: 31 May 2022

**Today's Progress**: Form, Section, TextField, Formatter, Picker, @ForcusState and two-way binding

**Thoughts**: Two-way binding is powerful. SwiftUI simplies UI development a lot.

**Link to work**: [WeSplit](./WeSplit/)

## Day 10: 1 Jun 2022

**Today's Progress**: ZStack, Color, Image, Gradient structs and alert

**Thoughts**: LinearGradient, AngularGradient and RadialGradient make more colorful to the background. Various modifiers provide various functions, such as image shape and alert popup.

**Link to work**: [WeSplit](./GuessTheFlag/)

## Day 11: 2 Jun 2022

**Today's Progress**: Frame, Modifier Ordering, Conditional Modifier by Ternary, Environment Modifier vs Regular Modifier, Set View as Properties, View Composition, Custom Modifier and Custom Container.

**Thoughts**: There are various customisation from Modifier, View and Container. They allow developers to fine tune UI components in a modularised design.

**Link to work**: [CustomExample](./CustomExample/)

## Day 12: 4 Jun 2022

**Today's Progress**: Building a Rock-Paper-Scissors app with skills learnt before.

**Thoughts**: It is straightforward to put components together, but it needs more detail or lesson learnt how to adjust each component like Text and Button to look more beautiful.

**Link to work**: [RockPaperScissors](./RockPaperScissors/)

## Day 13: 5 Jun 2022

**Today's Progress**: Building a Bed-time Recommendation app with DatePicker, Stepper, Picker and CoreML

**Thoughts**: Create ML is very easy to use with a friendly user-interface. Developers can import data, select target and features and output trained model back to XCode.

**Link to work**: [BetterRest](./BetterRest/)

## Day 14: 6 Jun 2022

**Today's Progress**: Building a Word Scramble game app with List, onSubmit, onAppear, withAnimation, String methods and UITextChecker

**Thoughts**: The modifier methods make interactions much easy. withAnimation makes the app live. UITextChecker which belongs to UIKit can be used in Swift too.

**Link to work**: [WordScramble](./WordScramble/)

## Day 15: 9 Jun 2022

**Today's Progress**: scaleEffect, opacity, onAppear, Int.animation, rotation3DEffect, interpolatingSpring, gesture, transition, ViewModifier, AnyTransition and onTapGesture

**Thoughts**: Animation is one of powerful features of SwiftUI. It makes iOS look much unique in appearance than others. It also emphasises how GUI design is important in developing an application.

**Link to work**: [CustomExample2](./CustomExample2/)

## Day 16: 12 Jun 2022

**Today's Progress**: applied previous learnt components to make up a Times Table Quiz app. The pictures were downloaded from [https://kenney.nl/](https://kenney.nl/)

**Thoughts**: UX Design is quite a knowledge! The job becomes more achievable when you start with simple components then you enhance each component with images, effects and animations step by step. 

**Link to work**: [TimesTableQuiz](./TimesTableQuiz/)

## Day 17: 14 Jun 2022

**Today's Progress**: class as a collection of @Published for struct items. Use didSet to save entity items. Use init to initiate values of entity items. @StateObject and @ObservedObject to bind with class of a collection of @Published elements. Use @Environment(\.dismiss) to dismiss a modal view. Also sheet and onDelete which simplify operation of modal views and list items.

**Thoughts**: The communications amongst views can be implemented with various annotations including @Binding, @StateObject,  @ObservedObject and @Environment. The variety is subject to the scope and the type of targets (struct or class). 

**Link to work**: [iExpense](./iExpense/)

## Day 18: 16 Jun 2022

**Today's Progress**: NavigationView, GeometryReader, ScrollView, GridItem, LazyHGrid, LazyVGrid, JSONDecoder

**Thoughts**: NavigationView and NavigationLink allow us to switch different screen views. GridItem list items in a gridded style. By extension to Bundle, you can easily read JSON files into arrays. After drafting the app in a single file, you can separate various view components into multiple files then fine tune each component.

**Link to work**: [Moonshot](./Moonshot/)

## Day 19: 22 Jun 2022

**Today's Progress**: ImagePaint, Shape, Path, CGAffineTransform, drawingGroup, how to make a single property Animatable and AnimatablePair for animations of two properties.

**Thoughts**: Drawing components can work with Form components together. Drawing relying on Path can also be adjusted by the frame size.

**Link to work**: [Drawing](./Drawing/)

## Day 20: 22 Jun 2022

**Today's Progress**: Codable, Hashable, Identifiable, ObservableObject, @Published, @ObservedObject, @Environment(\.dismiss) and .sheet.

**Thoughts**: This is another build from scratch exercise. Although most functions can be implemented, a bug cannot be resolved: When a button is pressed, it will change two variables. One is to show `.sheet` and the other is to change the sheet's object. The former is fine to show the sheet but the latter is not effective during showing the sheet until the other object is selected. If the variable is shown somewhere such as Text, the problem is gone. It leads me next time learn more how to handle @State and `.sheet`.

**Link to work**: [HabitTracking](./HabitTracking/)
