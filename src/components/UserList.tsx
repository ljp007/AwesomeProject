import React, { useEffect, useState } from 'react';
import { FlatList, Text,TouchableOpacity, View, StyleSheet, ActivityIndicator} from 'react-native';
import axios from 'axios';
import { useNavigation } from '@react-navigation/native';
import eventEmitter from '../rnnofication/EventEmitter';


type User = {
  id: number;
  name: string;
};

const UserList: React.FC = () => {
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);

  const navigation = useNavigation();
 
  useEffect(() => {
      const fetchUsers = async () => {
            try {
              const response = await axios.get<User[]>('https://jsonplaceholder.typicode.com/users');
              setUsers(response.data);
              setLoading(false);
              console.log('Sending UsersLoaded event');
              eventEmitter.emit('UsersLoaded', { success: true, users: response.data }); // 发送事件
            } catch (error) {
              console.error(error);
              setLoading(false);
              console.log('Sending UsersLoaded event');
              eventEmitter.emit('UsersLoaded', { success: false }); // 发送事件
            }
          };

          fetchUsers();

          // 监听事件
          const subscription = eventEmitter.addListener('UsersLoaded', (event) => {
            console.log('Received event: ', event);
          });

          // 清理监听器
          return () => {
            subscription.remove();
          };
  }, []);
    
  if (loading) {
      return <ActivityIndicator size="large" color="#0000ff" />;
  }

  const renderItem = ({ item }: { item: User }) => (
    <TouchableOpacity onPress={() => navigation.navigate('UserDetails', { userId: item.id })}>
      <View style={styles.item}>
        <Text>{item.name}</Text>
      </View>
    </TouchableOpacity>
  );

  return (
    <FlatList
      data={users}
      renderItem={renderItem}
      keyExtractor={item => item.id.toString()}
    />
  );
};

const styles = StyleSheet.create({
  item: {
    padding: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
  },
});

export default UserList;

