import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import React from "react";
import "react-native-gesture-handler";
import { NavigationContainer } from "@react-navigation/native";
import store from "./src/store";
import { PaperProvider, DefaultTheme } from "react-native-paper";
import { Provider as ReduxProvider } from "react-redux";
import axios from "axios";
axios.defaults.withCredentials = true;
import AppStack from "./src/navigators/AppStack";
const theme = {
  ...DefaultTheme,
  version: 3,
};

export default function App() {
  return (
    <ReduxProvider store={store}>
      <PaperProvider theme={theme}>
        <NavigationContainer>
          <AppStack />
        </NavigationContainer>
      </PaperProvider>
    </ReduxProvider>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
