Space Calculator Flutter App
The Space Calculator is a Flutter mobile application that allows users to calculate their weight on various celestial bodies. The application provides the weight of the user on different planets, moons, and other celestial bodies. The application can also provide the weight on the International Space Station and even on a Black Hole.

The application uses a gravitational factor to calculate the weight of the user on different celestial bodies. The gravitational factor is the ratio of the gravitational force exerted by the celestial body to the gravitational force exerted by the Earth. The gravitational factors for each celestial body are defined in a map named gravityFactor.

Screens
The Space Calculator app has two screens:

InputPage: The InputPage is the home screen of the application where users can select a celestial body to calculate their weight. The InputPage contains a Counter Card V2 widget, which allows users to select their weight. The InputPage also contains Celestial Body Cards that display the name and image of the celestial body. When the user taps a celestial body card, the application navigates to the ResultsPage and displays the weight of the user on that celestial body.

ResultsPage: The ResultsPage displays the weight of the user on the selected celestial body. The ResultsPage contains a Reusable Card widget that displays the name and image of the selected celestial body, along with the weight of the user on that celestial body.

Widgets
The Space Calculator app uses the following custom widgets:

CounterCardTwoButtonsV2: The CounterCardTwoButtonsV2 widget is a custom widget that displays a counter with two buttons to increment and decrement the counter value. The widget is used to select the weight of the user on the InputPage.

CelestialBodyCard: The CelestialBodyCard widget is a custom widget that displays the name and image of a celestial body. The widget is used to select the celestial body on the InputPage.

ReusableCard: The ReusableCard widget is a custom widget that displays the name and image of a celestial body, along with the weight of the user on that celestial body. The widget is used to display the results on the ResultsPage.

BottomButton: The BottomButton widget is a custom widget that displays a button at the bottom of the screen. The widget is used to navigate from the InputPage to the ResultsPage and vice versa.

CalculatorBrain
The CalculatorBrain class is a utility class that provides the functionality to calculate the weight of the user on different celestial bodies. The class takes the weight of the user and the selected celestial body as input parameters and calculates the weight of the user on the selected celestial body. The class also provides the name and image of the selected celestial body.

Constants
The Constants file contains the constant values used in the Space Calculator app, such as the color and text styles.

CelestialObject
The CelestialObject enum is used to define the different celestial bodies that the user can select on the InputPage. The enum contains the names of the celestial bodies and is used to access the gravitational factor of each celestial body from the gravityFactor map.

GravityFactor
The gravityFactor map contains the gravitational factors of different celestial bodies. The gravitational factor is the ratio of the gravitational force exerted by the celestial body to the gravitational force exerted by the Earth. The gravitational factors are used to calculate the weight of the user on different celestial bodies.
