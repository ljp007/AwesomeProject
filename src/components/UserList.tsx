import React, { useEffect, useState } from 'react';
import { FlatList, Text,TouchableOpacity, View, StyleSheet } from 'react-native';
import axios from 'axios';
//import { NavigationStackProp } from '@react-navigation/stack';
import { useNavigation } from '@react-navigation/native';


type User = {
  id: number;
  name: string;
};

//type UserListProps = {
//  navigation: NavigationStackProp<any>;
//};

const UserList: React.FC = () => {
  const [users, setUsers] = useState<User[]>([]);
  const navigation = useNavigation();
 
  useEffect(() => {
    axios.get('https://jsonplaceholder.typicode.com/users')
      .then(response => {
        setUsers(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  }, []);

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

