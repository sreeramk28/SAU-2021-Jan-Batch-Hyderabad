/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
import 'react-native-gesture-handler'
import * as React from 'react';
import { Text, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Upcoming from './components/Upcoming';
import TopRated from './components/TopRated';
import Popular from './components/Popular';



const Tab = createBottomTabNavigator(); 

class App extends React.Component {
  render() {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Upcoming" component={Upcoming} />
        <Tab.Screen name="Top Rated" component={TopRated} />
        <Tab.Screen name="Popular" component={Popular} />
      </Tab.Navigator>
    </NavigationContainer>
  );
  }
}

export default App;
