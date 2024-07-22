import React, { useEffect, useState } from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import axios from 'axios';
import {useNavigation, RouteProp } from '@react-navigation/native';

type UserDetailsRouteProp = RouteProp<{ UserDetails: { userId: number } }, 'UserDetails'>;

type UserDetailsProps = {
  route: UserDetailsRouteProp;
};

type User = {
  id: number;
  name: string;
  username: string;
  email: string;
  phone: string;
  website: string;
};

const UserDetails: React.FC<UserDetailsProps> = ({ route }) => {
  const { userId } = route.params;
  const [user, setUser] = useState<User | null>(null);
  const navigation = useNavigation();

  useEffect(() => {
    axios.get(`https://jsonplaceholder.typicode.com/users/${userId}`)
      .then(response => {
        setUser(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  }, [userId]);

  if (!user) {
    return <Text>Loading...</Text>;
  }

  return (
    <View style={styles.container}>
      <Text style={styles.name}>{user.name}</Text>
      <Text>Username: {user.username}</Text>
      <Text>Email: {user.email}</Text>
      <Text>Phone: {user.phone}</Text>
      <Text>Website: {user.website}</Text>
      <Button title="Back to User List" onPress={() => navigation.goBack()} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  name: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
  },
});

export default UserDetails;

