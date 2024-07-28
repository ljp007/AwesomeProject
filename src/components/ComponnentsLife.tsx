import React, { Component } from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';

interface AwComponentProps{
    initialCount: number;
}

interface AwComponentState {
    count: number;
}

class ComponnentsLife extends Component<AwComponentProps, AwComponentState> {
    constructor(props: AwComponentProps) {
      super(props);
      // 初始化 state
      this.state = {
        count: props.initialCount
      };
      // 绑定事件处理函数
      this.increment = this.increment.bind(this);
    }
  
    static getDerivedStateFromProps(nextProps: AwComponentProps, prevState: AwComponentState) {
      // 可以在这里同步 state 和 props
      if (nextProps.initialCount !== prevState.count) {
        return {
          count: nextProps.initialCount
        };
      }
      return null;
    }
  
    shouldComponentUpdate(nextProps: AwComponentProps, nextState: AwComponentState) {
      // 控制组件是否需要更新
      return nextState.count !== this.state.count;
    }
  
    getSnapshotBeforeUpdate(prevProps: AwComponentProps, prevState: AwComponentState) {
      // 捕获快照
      return { prevCount: prevState.count };
    }
  
    componentDidUpdate(prevProps: AwComponentProps, prevState: AwComponentState, snapshot: any) {
      // 更新完成后的操作
      if (snapshot && snapshot.prevCount !== this.state.count) {
        console.log(`Count changed from ${snapshot.prevCount} to ${this.state.count}`);
      }
    }
  
    componentDidMount() {
      // 组件挂载后的操作
      console.log('Component did mount');
    }
  
    componentWillUnmount() {
      // 组件卸载前的清理操作
      console.log('Component will unmount');
    }
  
    increment() {
      this.setState(prevState => ({
        count: prevState.count + 1
      }));
    }
  
    render() {
      return (
        <View style={styles.container}>
          <Text>Count: {this.state.count}</Text>
          <Button title="Increment" onPress={this.increment} />
        </View>
      );
    }
  }
  
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center'
    }
  });
  
  export default ComponnentsLife;
  