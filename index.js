import 'react-native-gesture-handler';
import React from 'react';
import {AppRegistry} from 'react-native';
import UserList from './src/components/UserList';
import { name as appName } from './app.json';
import App from './App';





// 整体js模块的名称
//AppRegistry.registerComponent('UserList', () => UserList);
AppRegistry.registerComponent(appName, () => App);


