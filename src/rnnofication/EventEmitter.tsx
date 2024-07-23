import { NativeModules, NativeEventEmitter } from 'react-native';

const { EventEmitterModule } = NativeModules;

// 确保 EventEmitterModule 非空
if (!EventEmitterModule) {
  throw new Error('EventEmitterModule is not linked correctly. Please ensure that the native module is properly registered.');
}

const eventEmitter = new NativeEventEmitter(EventEmitterModule);

export default eventEmitter;

